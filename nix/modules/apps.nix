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
      calibre
      discord
      thunderbird
    ]
    ++ lib.optionals (!pkgs.stdenv.isDarwin) [
      hayase
      pureref
      signal-desktop
      vlc
      zapzap

      (bottles.override {
        removeWarningPopup = true;
      })
    ];
}
