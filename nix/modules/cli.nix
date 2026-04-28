{pkgs, ...}: let
  porsmo = pkgs.porsmo.overrideAttrs (
    _:
      with pkgs; {
        buildInputs =
          []
          ++ lib.optionals (stdenv.isLinux) [
            alsa-lib
          ];
      }
  );
in {
  home.packages = with pkgs;
    [
      asciiquarium
      bat
      bat-extras.batman
      btop
      cmatrix
      dbus
      delta
      # dict
      dua
      eza
      fastfetch
      fd
      ffmpeg
      figlet
      fontconfig
      ghostscript
      glow
      gnupg
      hledger
      hledger-ui
      hyfetch
      hyperfine
      imagemagick
      just
      macchina
      mediainfo
      mermaid-cli
      mpc
      mpd
      mupdf
      ngspice
      nushell
      oxipng
      p7zip
      pandoc
      pass
      pinentry-tty
      porsmo
      presenterm
      ripgrep
      rmpc
      rustmission
      sesh
      skim
      speedtest-rs
      starship
      syncthing
      television
      timewarrior
      timg
      tlrc
      tmux
      tokei
      usbutils
      websocat
      wget
      xclip
      yazi
      yt-dlp
      # zathura
      zip
      zoxide
    ]
    ++ lib.optionals (pkgs.stdenv.isLinux) [
      dmenu
      hygg
      parted
      quickshell
      rofi
      wineWow64Packages.stable
    ];
}
