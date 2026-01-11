{pkgs, ...}: {
  home.packages = with pkgs;
    [
      bat
      bat-extras.batman
      eza
      ffmpeg
      fzf
      neofetch
      nushell
      ripgrep
      starship
      syncthing
      tlrc
      usbutils
      xclip
      yazi
      zoxide
    ]
    ++ lib.optionals (!pkgs.stdenv.isDarwin) [
      quickshell
    ];
}
