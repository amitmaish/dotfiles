{
  pkgs,
  lib,
  ...
}: let
  hayase = pkgs.callPackage ../apps/hayase.nix {};
in {
  home.packages = with pkgs;
    [
      anki
      neovide
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
    discord = {enable = true;};
    firefox = {enable = true;};
  };
}
