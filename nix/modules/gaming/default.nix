{pkgs, ...}: {
  imports = [
    ./emulation.nix
  ];

  home.packages = with pkgs;
    [
      prismlauncher
    ]
    ++ lib.optionals (!pkgs.stdenv.isDarwin) [
      lutris
      protonup-ng
      steam
    ];
}
