{pkgs, ...}: {
  home.packages = with pkgs; [
    alejandra
    nil
    nix-tree
  ];
}
