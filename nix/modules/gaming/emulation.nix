{
  pkgs,
  lib,
  config,
  ...
}: {
  options = {
    emulation.enable = lib.mkEnableOption "enables emulators";
    cemu = {
      enable = lib.mkEnableOption "enables cemu";
      ukmm = lib.mkEnableOption "enables ukmm. has no effect if cemu is disabled";
    };

    retroarch.enable = lib.mkEnableOption "enables retroarch";
  };

  config = lib.mkIf config.emulation.enable {
    home.packages = with pkgs; [
      cemu
      retroarch
      ukmm
    ];
  };
}
