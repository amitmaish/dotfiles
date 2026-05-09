{pkgs, ...}: {
  home.packages = with pkgs;
    [
      (python314.withPackages (ppkgs:
        with ppkgs; [
          idna
          numpy
        ]))
    ]
    ++ [
      ruff
      ty
      uv
    ];
}
