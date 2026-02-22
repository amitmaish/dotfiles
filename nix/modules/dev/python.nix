{pkgs, ...}: {
  home.packages = with pkgs; [
    python3
    python313Packages.idna
    ruff
    uv
  ];
}
