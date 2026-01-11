{
  description = "tiny";
  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    rust-overlay = {
      url = "github:oxalica/rust-overlay";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    noctalia = {
      url = "github:noctalia-dev/noctalia-shell";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    musnix = {
      url = "github:musnix/musnix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-darwin = {
      url = "github:nix-darwin/nix-darwin";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    self,
    nixpkgs,
    nix-darwin,
    home-manager,
    ...
  } @ inputs: {
    nixosConfigurations.amit-pc = nixpkgs.lib.nixosSystem rec {
      specialArgs = {inherit inputs system;};
      system = "x86_64-linux";
      modules = [
        ./configuration.nix
        home-manager.nixosModules.home-manager
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

    darwinConfigurations."amit-mbp" = nix-darwin.lib.darwinSystem {
      specialArgs = {inherit inputs;};
      system = "x86_64-darwin";
      modules = [
        ./hosts/amitmbp/configuration.nix
        home-manager.darwinModules.home-manager
        {
          home-manager = {
            extraSpecialArgs = {inherit inputs;};
            useGlobalPkgs = true;
            useUserPackages = true;
            users.amit = import ./hosts/amitmbp/home.nix;
            backupFileExtension = "backup";
          };
        }
      ];
    };
  };
}
