{pkgs, ...}: {
  home.packages = with pkgs;
    [
      (ghc.withPackages (hsPkgs:
        with haskellPackages; [
          cabal-gild
          cabal-install
          random
          stack
          tidal
        ]))
    ]
    ++ [
      haskell-language-server
      ormolu
    ];
}
