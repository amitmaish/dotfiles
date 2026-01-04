{
  config,
  pkgs,
  ...
}: {
  home.packages = with pkgs; [
    atkinson-hyperlegible
    noto-fonts
    noto-fonts-cjk-sans
  ];

  fonts.fontconfig.enable = true;
}
