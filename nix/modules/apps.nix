{
  pkgs,
  lib,
  ...
}: let
  hayase = pkgs.callPackage ../apps/hayase.nix {};
in {
  home.packages = with pkgs;
    [
    ]
    ++ lib.optionals (!pkgs.stdenv.isDarwin) [
      calibre
      hayase
      pureref
      signal-desktop
      thunderbird
      vlc
      zapzap

      (bottles.override {
        removeWarningPopup = true;
      })
    ];
  programs = {
    anki = {enable = true;};
    discord = {enable = true;};
    qutebrowser = {enable = true;};
  };
}
