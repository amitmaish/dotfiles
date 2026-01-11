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

    retroarch.enable = lib.mkOption {
      type = lib.types.bool;
      default = true;
      description = "enables retroarch";
    };
  };

  config = lib.mkIf config.emulation.enable {
    home.packages = with pkgs; [
      cemu
      retroarch
      ukmm
    ];
  };
}
