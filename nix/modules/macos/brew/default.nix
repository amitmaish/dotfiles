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
      "dmenu-mac"
      "dorico"
      "focusrite-control"
      "focusrite-control-2"
      "handbrake-app"
      "inkscape"
      "loopback"
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
      "xquartz"
      "zoom"
      # "google-drive"
      # "retroarch"
    ];
    masApps = {
      compressor = 424390742;
      final_cut = 424389933;
      forScore = 363738376;
      logic = 634148309;
      mainstage = 634159523;
      motion = 434290957;
    };
    onActivation = {
      cleanup = "zap";
    };
  };
}
