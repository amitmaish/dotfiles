{
  config,
  pkgs,
  ...
}: {
  home.packages = with pkgs; [
    cemu
    retroarch
    ukmm
  ];
}
