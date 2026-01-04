{pkgs, ...}: {
  home.packages = with pkgs; [
    go
    gofumpt
    gopls
    gotools
  ];
}
