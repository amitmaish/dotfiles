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
    winapps = {
      url = "github:winapps-org/winapps";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    musnix = {
      url = "github:musnix/musnix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    self,
    nixpkgs,
    home-manager,
    rust-overlay,
    winapps,
    ...
  } @ inputs: {
    nixosConfigurations.amit = nixpkgs.lib.nixosSystem rec {
      specialArgs = {inherit inputs system;};
      system = "x86_64-linux";
      modules = [
        inputs.musnix.nixosModules.musnix
        ./configuration.nix
        ./modules/virtualisation.nix
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
        ({pkgs, ...}: {
          nixpkgs.overlays = [rust-overlay.overlays.default];
          environment.systemPackages = [pkgs.rust-bin.stable.latest.default];
        })
        (
          {
            pkgs,
            system ? pkgs.system,
            ...
          }: {
            environment.systemPackages = [
              winapps.packages."${system}".winapps
              winapps.packages."${system}".winapps-launcher # optional
            ];
          }
        )
        ./modules/noctalia.nix
      ];
    };
  };
}
