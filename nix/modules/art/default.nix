{pkgs, ...}: {
  imports = [
    ./blender.nix
    ./colmap.nix
    ./pureref.nix
  ];

  home.packages = with pkgs; [
    rapidraw
  ];
}
