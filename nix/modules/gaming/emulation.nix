{
  config,
  pkgs,
  ...
}: {
  home.packages = with pkgs; [
    cemu
    ukmm
  ];
}
