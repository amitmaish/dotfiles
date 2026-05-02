{
  pkgs,
  lib,
  config,
  ...
}: let
  cemu =
    if pkgs.stdenv.isDarwin
    then pkgs.cemu-bin
    else pkgs.cemu;
  ukmm =
    if pkgs.stdenv.isDarwin
    then pkgs.ukmm-bin
    else pkgs.ukmm;
  azahar =
    if pkgs.stdenv.isDarwin
    then pkgs.azahar-bin
    else pkgs.azahar;
in {
  options = {
    emulation.enable = lib.mkOption {
      type = lib.types.bool;
      default = true;
      description = "enables video game emulation";
    };
    retroarch.enable = lib.mkOption {
      type = lib.types.bool;
      default = true;
      description = "enables retroarch";
    };
    cemu = {
      enable = lib.mkOption {
        type = lib.types.bool;
        default = true;
        description = "enables cemu";
      };
      ukmm = lib.mkOption {
        type = lib.types.bool;
        default = true;
        description = "enables ukmm. has no effect if cemu is disabled";
      };
    };
  };

  config = lib.mkIf config.emulation.enable {
    home.packages = with pkgs;
      [
        azahar
        ryubing
      ]
      ++ lib.optionals config.retroarch.enable [
        retroarch
      ]
      ++ lib.optionals config.cemu.enable [
        cemu
      ]
      ++ lib.optionals (config.cemu.enable && config.cemu.ukmm) [
        ukmm
      ];
  };
}
