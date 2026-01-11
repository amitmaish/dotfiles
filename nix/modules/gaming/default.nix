{
  lib,
  pkgs,
  ...
}: {
  imports = [
    ./emulation.nix
  ];

  emulation.enable = lib.mkDefault true;
  cemu = {
    enable = lib.mkDefault true;
    ukmm = lib.mkDefault true;
  };
  retroarch.enable = lib.mkDefault true;

  home.packages = with pkgs; [
    lutris
    steam
    prismlauncher
    protonup-ng
  ];
}
