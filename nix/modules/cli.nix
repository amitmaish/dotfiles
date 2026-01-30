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
      fontconfig
      fzf
      just
      mediainfo
      neofetch
      nushell
      p7zip
      presenterm
      ripgrep
      starship
      syncthing
      timg
      tlrc
      usbutils
      xclip
      yazi
      yt-dlp
      zip
      zoxide
    ]
    ++ lib.optionals (!pkgs.stdenv.isDarwin) [
      quickshell
    ];
}
