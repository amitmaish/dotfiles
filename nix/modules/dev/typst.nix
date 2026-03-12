{pkgs, ...}: {
  home.packages = with pkgs; [
    prettypst
    tinymist
    typship
    typst
    typstyle
  ];
}
