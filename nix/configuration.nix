{
  config,
  pkgs,
  inputs,
  ...
}: {
  imports = [
    ./hardware-configuration.nix
  ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  boot.kernelPackages = pkgs.linuxPackages_latest;

  boot.kernelModules = [
    "kvm-intel"
    "nvidia"
    "nvidia-drm"
    "nvidia-modeset"
    "nvidia-uvm"
    "nvidiafb"
  ];
  boot.initrd.kernelModules = ["nvidia"];
  boot.extraModulePackages = [config.boot.kernelPackages.nvidia_x11];

  networking.hostName = "nixos";
  networking.networkmanager.enable = true;

  time.timeZone = "America/Los_Angeles";

  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };

  programs.niri.enable = true;

  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };
  hardware.nvidia = {
    modesetting.enable = true;

    nvidiaSettings = true;

    powerManagement.enable = false;

    powerManagement.finegrained = false;

    #open source driver
    open = true;

    package = config.boot.kernelPackages.nvidiaPackages.production;
  };

  services.xserver = {
    enable = true;
    autoRepeatDelay = 200;
    autoRepeatInterval = 25;

    xkb = {
      layout = "us";
      variant = "";
    };

    videoDrivers = ["nvidia"];
  };

  services.displayManager.ly.enable = true;

  programs.fish.enable = true;

  users.users.amit = {
    isNormalUser = true;
    description = "amit";
    extraGroups = [
      "audio"
      "docker"
      "jackaudio"
      "kvm"
      "libvirtd"
      "networkmanager"
      "podman"
      "wheel"
    ];
    packages = [];
    shell = pkgs.fish;
  };

  users.extraGroups.docker.members = ["amit"];

  nixpkgs.config = {
    allowUnfree = true;
  };
  programs.nix-ld.enable = true;
  programs.nix-ld.libraries = with pkgs; [
    libGL
  ];

  programs.appimage = {
    enable = true;
    binfmt = true;
  };

  programs.firefox.enable = true;

  environment.systemPackages = with pkgs; [
    alacritty
    cudatoolkit
    ghostty
    git
    kdePackages.dolphin
    neovim
    podman-compose
    qjackctl
    unzip
    vim
    wget
    winboat
    xwayland-satellite
  ];

  fonts.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
  ];

  nix.settings.experimental-features = ["nix-command" "flakes"];

  services.openssh.enable = true;
  services.udisks2.enable = true;

  virtualisation = {
    containers.enable = true;
    podman = {
      enable = true;
      defaultNetwork.settings.dns_enabled = true;
    };
    docker.enable = true;
    libvirtd = {
      enable = true;
      qemu. swtpm.enable = true;
    };
    spiceUSBRedirection.enable = true;
  };
  services.spice-vdagentd.enable = true;
  programs.virt-manager.enable = true;

  system.stateVersion = "25.05";

  system.autoUpgrade = {
    enable = true;
    flake = inputs.self.outPath;
    flags = [
      "--update-input"
      "nixpkgs"
      "-L" # print build logs
    ];
    dates = "02:00";
    randomizedDelaySec = "45min";
  };

  musnix.enable = true;

  services.jack = {
    jackd.enable = true;
    alsa.enable = true;
    loopback = {
      enable = false;
    };
  };

  services.samba = {
    enable = true;
    securityType = "user";
    openFirewall = true;
    settings = {
      global = {
        "workgroup" = "WORKGROUP";
        "server string" = "smbnix";
        "netbios name" = "smbnix";
        "security" = "user";
        #"use sendfile" = "yes";
        #"max protocol" = "smb2";
        # note: localhost is the ipv6 localhost ::1
        "hosts allow" = "192.168.0. 127.0.0.1 localhost";
        "hosts deny" = "0.0.0.0/0";
        "guest account" = "nobody";
        "map to guest" = "bad user";
      };
      "public" = {
        "path" = "/mnt/Shares/Public";
        "browseable" = "yes";
        "read only" = "no";
        "guest ok" = "yes";
        "create mask" = "0644";
        "directory mask" = "0755";
        "force user" = "username";
        "force group" = "groupname";
      };
      "private" = {
        "path" = "/mnt/Shares/Private";
        "browseable" = "yes";
        "read only" = "no";
        "guest ok" = "no";
        "create mask" = "0644";
        "directory mask" = "0755";
        "force user" = "username";
        "force group" = "groupname";
      };
    };
  };

  services.samba-wsdd = {
    enable = true;
    openFirewall = true;
  };

  services.tailscale.enable = true;
  networking.nftables.enable = true;
  networking.firewall.checkReversePath = "loose";

  networking.firewall.enable = true;
  networking.firewall.allowPing = true;

  nix.gc = {
    automatic = true;
    dates = "02:00";
    randomizedDelaySec = "45min";
  };

  nix.optimise = {
    automatic = true;
    dates = "02:00";
    randomizedDelaySec = "45min";
  };
}
