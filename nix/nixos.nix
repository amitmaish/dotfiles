{inputs, ...}: {
  flake = {
    nixosConfigurations.amit-pc = inputs.nixpkgs.lib.nixosSystem rec {
      specialArgs = {inherit inputs system;};
      system = "x86_64-linux";
      modules = [
        ./configuration.nix
        inputs.home-manager.nixosModules.home-manager
        {
          home-manager = {
            extraSpecialArgs = {inherit inputs;};
            useGlobalPkgs = true;
            useUserPackages = true;
            users.amit = import ./home.nix;
            backupFileExtension = "backup";
          };
        }
        ./modules/noctalia.nix
      ];
    };
  };
}
