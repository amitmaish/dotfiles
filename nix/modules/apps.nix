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
      qutebrowser
    ]
    ++ lib.optionals (!pkgs.stdenv.isDarwin) [
      anki
      calibre
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
  };
}
