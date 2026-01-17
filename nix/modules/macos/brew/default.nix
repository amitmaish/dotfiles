{...}: {
  homebrew = {
    enable = true;
    brews = [
      "mas"
    ];
    casks = [
      "adobe-digital-editions"
      "bibdesk"
      "dorico"
      "firefox"
      "ghostty"
      "google-drive"
      "handbrake"
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
      "tailscale"
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
      autoUpdate = true;
      upgrade = true;
    };
  };
}
