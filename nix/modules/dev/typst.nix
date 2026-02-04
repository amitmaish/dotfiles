{pkgs, ...}: {
  home.packages = with pkgs; [
    prettypst
    tinymist
    typst
    typstyle
  ];
}
