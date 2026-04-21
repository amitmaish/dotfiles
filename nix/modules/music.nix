{
  config,
  lib,
  pkgs,
  ...
}: {
  options = {
    music = {
      enable = lib.mkOption {
        type = lib.types.bool;
        default = true;
        description = "nix music config";
      };
    };
  };

  config = lib.mkIf config.music.enable {
    home.packages = with pkgs;
      [
        audacity
        musescore
        reaper
      ]
      ++ lib.optionals (pkgs.stdenv.isLinux) [
        plugdata
        supercollider
        surge-xt
      ];
  };
}
