{pkgs, ...}: {
  imports = [
    ./emulation.nix
  ];

  home.packages = with pkgs;
    [
      nethack
      prismlauncher
    ]
    ++ lib.optionals (!pkgs.stdenv.isDarwin) [
      lutris
      protonup-ng
      steam
    ];
}
