{pkgs, ...}: {
  home.packages = with pkgs; [
    bat
    bat-extras.batman
    eza
    ffmpeg
    fzf
    neofetch
    nushell
    quickshell
    ripgrep
    starship
    syncthing
    tlrc
    usbutils
    xclip
    yazi
    zoxide
  ];
}
