{pkgs, ...}: {
  home.packages = with pkgs;
    [
      (ghc.withPackages (hsPkgs:
        with haskellPackages; [
          cabal-install
          stack
          tidal
        ]))
    ]
    ++ [
      haskell-language-server
      ormolu
    ];
}
