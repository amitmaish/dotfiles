{
  pkgs,
  lib,
  config,
  ...
}: {
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
      []
      ++ lib.optionals config.retroarch.enable [
        retroarch-full
      ]
      ++ lib.optionals config.cemu.enable [
        cemu
      ]
      ++ lib.optionals (config.cemu.enable && config.cemu.ukmm) [
        ukmm
      ];
  };
}
