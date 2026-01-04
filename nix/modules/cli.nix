{pkgs, ...}: {
  home.packages = with pkgs; [
    bat
    eza
    ffmpeg
    fzf
    neofetch
    quickshell
    ripgrep
    starship
    syncthing
    tlrc
    usbutils
    yazi
    zoxide
  ];
}
