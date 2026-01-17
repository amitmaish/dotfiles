{pkgs, ...}: {
  home.packages = with pkgs; [
    atkinson-hyperlegible
    nerd-fonts.hack
    noto-fonts
    noto-fonts-cjk-sans
  ];

  fonts.fontconfig.enable = true;
}
