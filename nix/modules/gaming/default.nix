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
      protonup-ng
      steam
    ];
}
