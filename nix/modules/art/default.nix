{
  pkgs,
  inputs,
  system,
  ...
}: let
  pkgs-stable = inputs.nixpkgs-stable.legacyPackages.${system};
in {
  imports = [
    ./blender.nix
    ./colmap.nix
    ./pureref.nix
  ];

  home.packages = with pkgs; [
    pkgs-stable.rapidraw
  ];
}
