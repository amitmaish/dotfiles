{pkgs, ...}: {
  home.packages = with pkgs;
    [
      bat
      bat-extras.batman
      cmatrix
      delta
      dict
      eza
      ffmpeg
      fzf
      neofetch
      nushell
      presenterm
      ripgrep
      starship
      syncthing
      tlrc
      usbutils
      xclip
      yazi
      yt-dlp
      zoxide
    ]
    ++ lib.optionals (!pkgs.stdenv.isDarwin) [
      quickshell
    ];
}
