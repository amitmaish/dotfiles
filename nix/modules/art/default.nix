{pkgs, ...}: {
  imports = [
    ./blender.nix
    ./colmap.nix
  ];

  home.packages = with pkgs;
    [
      rapidraw
    ]
    ++ lib.optionals (pkgs.stdenv.isLinux) [
      pureref
    ];
}
