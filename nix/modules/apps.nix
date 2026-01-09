{pkgs, ...}: let
  hayase = import ../apps/hayase.nix {inherit pkgs;};
in {
  home.packages = with pkgs; [
    anki
    calibre
    discord
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
}
