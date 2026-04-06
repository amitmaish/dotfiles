{pkgs, ...}: {
  home.packages = with pkgs;
    [
      (ghc.withPackages (hsPkgs:
        with haskellPackages; [
          stack
          tidal
        ]))
    ]
    ++ [
      haskell-language-server
      ormolu
    ];
}
