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
      "bibdesk"
      "dmenu-mac"
      "dorico"
      "focusrite-control"
      "focusrite-control-2"
      "handbrake-app"
      "inkscape"
      "midi-monitor"
      "obs"
      "openemu"
      "parsec"
      "plugdata"
      "praat"
      "qmk-toolbox"
      "signal"
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
      "zoom"
      # "google-drive"
      # "retroarch"
    ];
    masApps = {
      forScore = 363738376;
    };
    onActivation = {
      cleanup = "zap";
    };
  };
}
