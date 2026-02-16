{config, ...}: {
  boot.kernelModules = [
    "nvidia"
    "nvidia-drm"
    "nvidia-modeset"
    "nvidia-uvm"
    "nvidiafb"
  ];
  boot.initrd.kernelModules = ["nvidia"];
  boot.extraModulePackages = [config.boot.kernelPackages.nvidia_x11];

  hardware.nvidia = {
    modesetting.enable = true;

    nvidiaSettings = true;

    powerManagement.enable = false;

    powerManagement.finegrained = false;

    #open source driver
    open = false;

    package = config.boot.kernelPackages.nvidiaPackages.production;
  };
  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };

  services.xserver.videoDrivers = ["nvidia"];
}
