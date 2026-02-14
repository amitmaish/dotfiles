{...}: {
  homebrew = {
    enable = true;
    brews = [
      "mas"
    ];
    casks = [
      "adobe-digital-editions"
      "anki"
      "arduino-ide"
      "bibdesk"
      "dorico"
      "firefox"
      "google-drive"
      "handbrake-app"
      "inkscape"
      "kitty"
      "midi-monitor"
      "neovide-app"
      "nheko"
      "obs"
      "openemu"
      "parsec"
      "plugdata"
      "praat"
      "qmk-toolbox"
      "retroarch"
      "steinberg-activation-manager"
      "steinberg-download-assistant"
      "tailscale-app"
      "thunderbird"
      "tiled"
      "transmission"
      "vlc"
      "whatsapp"
      "zoom"
      "zotero"
    ];
    masApps = {};
    onActivation = {
      cleanup = "zap";
    };
  };
}
