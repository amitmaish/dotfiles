{pkgs, ...}: {
  system.defaults = {
    dock.autohide = true;
    dock.persistent-apps = [
      "/System/Applications/Messages.app"
      "/Applications/Signal.app"
      "/Applications/Ghostty.app"
      "/Applications/Firefox.app"
      "/Applications/Anki.app"
      "${pkgs.obsidian}/Applications/Obsidian.app"
      "/System/Applications/Calendar.app"
      "/Applications/Pianoteq 8"
      "/Applications/Dorico 6.app"
    ];
    finder.FXPreferredViewStyle = "clmv";
    loginwindow.GuestEnabled = false;
    NSGlobalDomain = {
      AppleICUForce24HourTime = true;
      AppleInterfaceStyle = "Dark";
      KeyRepeat = 2;
      _HIHideMenuBar = false;
    };
  };
}
