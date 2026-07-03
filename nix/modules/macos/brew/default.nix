{...}: {
  homebrew = {
    enable = true;
    brews = [
      "mas"
      "transmission-cli"
    ];
    casks = [
      "adobe-digital-editions"
      "arduino-ide"
      "audio-hijack"
      "bibdesk"
      "calibre"
      "dmenu-mac"
      "docker-desktop"
      "dorico"
      "focusrite-control"
      "focusrite-control-2"
      "gimp"
      "handbrake-app"
      "loopback"
      "midi-monitor"
      "obs"
      "openemu"
      "parsec"
      "plugdata"
      "praat"
      "qmk-toolbox"
      "qutebrowser"
      "raspberry-pi-imager"
      "signal"
      "steam"
      "steinberg-activation-manager"
      "steinberg-download-assistant"
      "steinberg-library-manager"
      "steinberg-mediabay"
      "supercollider"
      "surge-xt"
      "tailscale-app"
      "thunderbird"
      "tiled"
      "transmission"
      "whatsapp"
      "xquartz"
      "zoom"
      # "google-drive"
      # "inkscape"
      # "retroarch"
    ];
    # onActivation = {
    #   cleanup = "zap";
    # };
  };
}
