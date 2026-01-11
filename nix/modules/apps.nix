{pkgs, ...}: let
  hayase = pkgs.callPackage ../apps/hayase.nix {};
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
