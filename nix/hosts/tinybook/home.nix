{
  pkgs,
  inputs,
  ...
}: let
  dot = pkgs.callPackage ../../apps/dot/dot.nix {
    NAME = "tinybook";
    REBUILD_COMMAND = ''nh darwin switch ~/dotfiles/nix -H tinybook'';
    CURRENT_COMMAND = ''sudo darwin-rebuild --list-generations | grep "current" | awk '{print $1}' '';
    NOTIFY_COMMAND = ''terminal-notifier -group dot -title dot -message "rebuild successful!" '';
  };
in {
  home.username = "amit";

  home.stateVersion = "26.05";

  imports = [
    ../common/home.nix
    inputs.mac-app-util.homeManagerModules.default
  ];

  blender.enable = true;
  colmap.enable = true;
  cemu.enable = true;
  emulation.enable = true;
  music.enable = true;
  retroarch.enable = false;

  home.packages = with pkgs; [
    airdrop-cli
    dot
    m-cli
    swiftbar
    terminal-notifier
    xorg-server

    (writeShellApplication {
      name = "dmenu";
      text = ''dmenu-mac "$@"'';
    })
    (writeShellApplication {
      name = "rofi";
      text = ''dmenu-mac "$@"'';
    })
    (writeShellApplication {
      name = "sclang";
      text = ''/Applications/SuperCollider.app/Contents/MacOS/sclang "$@" '';
    })
  ];

  programs.aerospace = {
    enable = true;
    launchd.enable = true;
  };

  programs.ghostty.package = pkgs.ghostty-bin;

  programs.firefox.package = pkgs.firefox-bin;

  services.syncthing.enable = true;

  services.jankyborders = {
    enable = true;
    settings = {
      style = "round";
      width = 4.0;
      hidpi = "on";
      active_color = "0xffffd2e3";
      inactive_color = "0x00000000";
    };
  };
}
