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
    discord = {enable = true;};
    qutebrowser = {enable = true;};
  };
}
