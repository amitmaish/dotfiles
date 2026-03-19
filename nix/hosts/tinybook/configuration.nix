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

  # make macos aliases
  system.activationScripts.applications.text = let
    env = pkgs.buildEnv {
      name = "system-applications";
      paths = config.environment.systemPackages;
      pathsToLink = ["/Applications" "~/Applications/"];
    };
  in
    pkgs.lib.mkForce ''
      # Set up applications.
      echo "setting up /Applications..." >&2
      rm -rf /Applications/Nix\ Apps
      mkdir -p /Applications/Nix\ Apps
      find ${env}/Applications -maxdepth 1 -type l -exec readlink '{}' + |
      while read -r src; do
        app_name=$(basename "$src")
        echo "copying $src" >&2
        ${pkgs.mkalias}/bin/mkalias "$src" "/Applications/Nix Apps/$app_name"
      done
    '';
}
