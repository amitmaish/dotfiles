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
      just
      neofetch
      nushell
      p7zip
      presenterm
      ripgrep
      starship
      syncthing
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
