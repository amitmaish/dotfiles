{
  pkgs,
  lib,
  ...
}: let
  hayase = pkgs.callPackage ../apps/hayase.nix {};
in {
  home.packages = with pkgs;
    [
      neovide
    ]
    ++ lib.optionals (!pkgs.stdenv.isDarwin) [
      anki
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
  };
}
