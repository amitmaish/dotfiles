{
  pkgs,
  fetchurl,
  appimageTools,
}: let
  pname = "hayase";
  version = "6.4.46";

  src = fetchurl {
    url = "https://api.hayase.watch/files/linux-hayase-${version}-linux.AppImage";
    hash = "sha256-QvuxWtkcZbC94e7BcpTnFrhEZNItLJQQqUFODzJ83HA=";
  };
  appimageContents = appimageTools.extract {inherit pname version src;};
in
  appimageTools.wrapType2 {
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
