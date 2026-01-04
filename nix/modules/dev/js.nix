{pkgs, ...}: {
  home.packages = with pkgs; [
    biome
    nodejs
    prettier
    vtsls
  ];
}
