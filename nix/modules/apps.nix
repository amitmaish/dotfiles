{
  pkgs,
  lib,
  ...
}: let
  hayase = pkgs.callPackage ../apps/hayase.nix {};
in {
  home.packages = with pkgs;
    [
      qutebrowser
    ]
    ++ lib.optionals (pkgs.stdenv.isDarwin) [
      vlc-bin
    ]
    ++ lib.optionals (pkgs.stdenv.isLinux) [
      calibre
      fluffychat
      hayase
      pureref
      signal-desktop
      thunderbird
      transmission_4
      vlc
      zapzap

      (bottles.override {
        removeWarningPopup = true;
      })
    ];

  programs = {
    anki.enable = true;
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
  };
}
