{
  pkgs,
  lib,
  config,
  ...
}: {
  options = {
    arduino = {
      enable = lib.mkOption {
        type = lib.types.bool;
        default = true;
        description = "enables arduino development tools";
      };
      ide = lib.mkOption {
        type = lib.types.bool;
        default = false;
        description = "enables arduino_ide. has no effect if arduino.enable is false";
      };
    };
  };

  config = lib.mkIf config.arduino.enable {
    home.packages = with pkgs;
      [
        arduino-cli
        arduino-language-server
      ]
      ++ lib.optional config.arduino.ide [
        arduino-ide
      ];
  };
}
