{
  pkgs,
  lib,
  inputs,
  system,
  ...
}: let
  pkgs-stable = inputs.nixpkgs-stable.legacyPackages.${system};
in {
  home.packages = with pkgs;
    [
      inkscape
      kitty
      zotero
    ]
    ++ lib.optionals (pkgs.stdenv.isDarwin) [
      # pkgs-stable.qutebrowser
      anki-bin
      vlc-bin
    ]
    ++ lib.optionals (pkgs.stdenv.isLinux) [
      anki
      calibre
      fluffychat
      gparted
      nautilus
      qutebrowser
      signal-desktop
      themix-gui
      thunderbird
      transmission_4
      vlc
      zapzap
    ];

  programs = {
    discord.enable = true;
    firefox.enable = true;
    ghostty = {
      enable = true;
      enableBashIntegration = true;
      enableFishIntegration = true;
      enableZshIntegration = true;
    };
    neovide = {
      enable = true;
      settings = {
        frame = "transparent";
      };
    };
    obsidian.enable = true;
    sioyek.enable = true;
  };
}
