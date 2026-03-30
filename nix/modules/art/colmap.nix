{
  pkgs,
  lib,
  config,
  ...
}: let
  bool = lib.types.bool;
in {
  options = {
    colmap = {
      enable = lib.mkOption {
        type = bool;
        default = false;
        description = "installs colmap";
      };
    };
  };

  config = lib.mkIf config.colmap.enable {
    home.packages = with pkgs; [
      colmap
    ];
  };
}
