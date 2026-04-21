{
  pkgs,
  lib,
  config,
  ...
}: let
  bool = lib.types.bool;
in {
  options = {
    pureref.enable = lib.mkOption {
      type = bool;
      default = false;
      description = "enables pureref";
    };
  };

  config = lib.mkIf config.pureref.enable {
    home.packages = with pkgs; [
      pureref
    ];
  };
}
