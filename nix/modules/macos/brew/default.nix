{...}: {
  homebrew = {
    enable = true;
    brews = [
      "mas"
      "transmission-cli"
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
