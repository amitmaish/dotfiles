{
  pkgs,
  lib,
  ...
}: {
  home.packages = with pkgs;
    [
      kitty
      qutebrowser
      zotero
    ]
    ++ lib.optionals (pkgs.stdenv.isDarwin) [
      anki-bin
      vlc-bin
    ]
    ++ lib.optionals (pkgs.stdenv.isLinux) [
      anki
      calibre
      fluffychat
      gparted
      nautilus
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
