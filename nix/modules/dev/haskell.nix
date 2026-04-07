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
    ++ (with haskellPackages; [
      haskell-language-server
      ormolu
    ]);
}
