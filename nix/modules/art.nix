{
  pkgs,
  lib,
  config,
  ...
}: {
  options = {
    blender = {
      enable = lib.mkOption {
        type = lib.types.bool;
        default = true;
        description = "installs blender";
      };
      cuda = lib.mkOption {
        type = lib.types.bool;
        default = false;
        description = "installs with gpu support";
      };
    };
  };

  config = lib.mkIf config.blender.enable {
    home.packages = with pkgs; [
      (blender.override {
        cudaSupport = config.blender.cuda;
      })
    ];
  };
}
