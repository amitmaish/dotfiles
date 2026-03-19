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
      "handbrake-app"
      "inkscape"
      "midi-monitor"
      "obs"
      "openemu"
      "parsec"
      "plugdata"
      "praat"
      "qmk-toolbox"
      "steinberg-activation-manager"
      "steinberg-download-assistant"
      "steinberg-library-manager"
      "steinberg-mediabay"
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
