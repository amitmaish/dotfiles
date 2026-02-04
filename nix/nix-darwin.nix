{inputs, ...}: {
  flake = {
    darwinConfigurations."amit-mbp" = inputs.nix-darwin.lib.darwinSystem rec {
      specialArgs = {inherit inputs system;};
      system = "x86_64-darwin";
      modules = [
        ./hosts/amitmbp/configuration.nix
        inputs.home-manager.darwinModules.home-manager
        {
          home-manager = {
            extraSpecialArgs = {inherit inputs system;};
            useGlobalPkgs = true;
            useUserPackages = true;
            users.amit = import ./hosts/amitmbp/home.nix;
            backupFileExtension = "backup";
          };
        }
        inputs.nix-homebrew.darwinModules.nix-homebrew
        {
          nix-homebrew = {
            enable = true;
            user = "amit";
            autoMigrate = true;
          };
        }
      ];
    };
  };
}
