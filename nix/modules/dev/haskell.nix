{pkgs, ...}: {
  home.packages = with pkgs;
    [
      (ghc.withPackages (hsPkgs:
        with haskellPackages; [
          tidal
        ]))
    ]
    ++ [
      haskell-language-server
      ormolu
    ];
}
