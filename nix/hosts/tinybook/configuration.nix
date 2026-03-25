{
  pkgs,
  inputs,
  config,
  ...
}: {
  imports = [
    ../../modules/macos
    ./system.nix
  ];
  environment.systemPackages = with pkgs; [
    vim
    xquartz
  ];
  environment.shells = with pkgs; [
    bash
    fish
    nushell
    zsh
  ];

  nix.package = pkgs.nix;
  nixpkgs = {
    config = {
      allowUnfree = true;
    };
    overlays = [
      inputs.rust-overlay.overlays.default
      inputs.tinix.overlays.default
    ];
  };

  # Necessary for using flakes on this system.
  nix.settings.experimental-features = "nix-command flakes";

  programs.bash.enable = true;
  programs.fish.enable = true;
  programs.zsh.enable = true;

  system.stateVersion = 4;
  system.primaryUser = "amit";
  ids.gids.nixbld = 350;

  # The platform the configuration will be used on.
  nixpkgs.hostPlatform = "aarch64-darwin";

  users.users.amit = {
    name = "amit";
    home = "/Users/amit";
  };

  services.tailscale.enable = true;
}
