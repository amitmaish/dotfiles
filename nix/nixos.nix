{inputs, ...}: {
  flake = {
    nixosConfigurations.amit-pc = inputs.nixpkgs.lib.nixosSystem rec {
      specialArgs = {inherit inputs system;};
      system = "x86_64-linux";
      modules = [
        ./hosts/pc/configuration.nix
        inputs.home-manager.nixosModules.home-manager
        {
          home-manager = {
            extraSpecialArgs = {inherit inputs system;};
            useGlobalPkgs = true;
            useUserPackages = true;
            users.amit = import ./hosts/pc/home.nix;
            backupFileExtension = "backup";
          };
        }
        ./modules/noctalia.nix
      ];
    };
  };
}
