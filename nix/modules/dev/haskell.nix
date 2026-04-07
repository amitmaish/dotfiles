{pkgs, ...}: {
  home.packages = with pkgs; [
    (ghc.withPackages (hsPkgs:
      with haskellPackages; [
        cabal-install
        haskell-language-server
        ormolu
        stack
        tidal
      ]))
  ];
}
