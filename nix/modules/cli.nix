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
      # dict
      # zathura
      asciiquarium
      bat
      bat-extras.batman
      btop
      cmatrix
      dbus
      delta
      dua
      exiftool
      eza
      fastfetch
      fd
      ffmpeg
      figlet
      fontconfig
      geogebra
      ghostscript
      glow
      gnupg
      harlequin
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
      sc-im
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
      visidata
      websocat
      wget
      xclip
      yazi
      yt-dlp
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
