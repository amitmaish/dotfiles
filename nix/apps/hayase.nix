{pkgs, ...}: let
  pname = "hayase";
  version = "6.4.44";

  src = pkgs.fetchurl {
    url = "https://api.hayase.watch/files/linux-hayase-6.4.44-linux.AppImage";
    hash = "sha256-qzHjpeN6iNb+Wxi6ttVDMkxPSSqLts4QFkAVpBSwpv0=";
  };
  appimageContents = pkgs.appimageTools.extract {inherit pname version src;};
in
  pkgs.appimageTools.wrapType2 {
    inherit pname version src;
    pkgs = pkgs;
    extraInstallCommands = ''
      install -m 444 -D ${appimageContents}/${pname}.desktop -t $out/share/applications
      substituteInPlace $out/share/applications/${pname}.desktop \
        --replace 'Exec=AppRun' 'Exec=${pname}'
      cp -r ${appimageContents}/usr/share/icons $out/share

      # ln -s $out/bin/${pname}-${version} $out/bin/${pname}
    '';
  }
