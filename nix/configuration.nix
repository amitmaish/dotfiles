{
  pkgs,
  inputs,
  ...
}: {
  imports = [
    ./hardware-configuration.nix
    ./modules/audio.nix
    ./modules/nvidia.nix
    ./modules/samba.nix
    ./modules/tailscale.nix
    ./modules/virtualisation.nix
    inputs.musnix.nixosModules.musnix
  ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  boot.kernelPackages = pkgs.linuxPackages_latest;

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

  services.xserver = {
    enable = true;
    autoRepeatDelay = 200;
    autoRepeatInterval = 25;

    xkb = {
      layout = "us";
      variant = "";
    };
  };

  services.displayManager.ly.enable = true;
  programs.niri.enable = true;

  programs.fish.enable = true;
  programs.zsh.enable = true;

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

  nixpkgs = {
    config = {
      allowUnfree = true;
    };
    overlays = [
      inputs.rust-overlay.overlays.default
      inputs.tinix.overlays.default
    ];
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

  services.dictd = {
    enable = true;
    DBs = with pkgs.dictdDBs; [
      wiktionary
      wordnet
    ];
  };

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
