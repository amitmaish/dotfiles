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
      "ghostty"
      "google-drive"
      "handbrake-app"
      "inkscape"
      "jordanbaird-ice"
      "kitty"
      "midi-monitor"
      "neovide-app"
      "obs"
      "openemu"
      "parsec"
      "plugdata"
      "praat"
      "qmk-toolbox"
      "retroarch"
      "steinberg-activation-manager"
      "steinberg-download-assistant"
      "sublime-text"
      "tailscale-app"
      "thunderbird"
      "tiled"
      "virtualbox"
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
