{pkgs, ...}: {
  home.packages = with pkgs;
    [
      bat
      bat-extras.batman
      cmatrix
      delta
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
      zoxide
    ]
    ++ lib.optionals (!pkgs.stdenv.isDarwin) [
      quickshell
    ];
}
