{pkgs, ...}: {
  home.packages = with pkgs; [
    wgsl-analyzer
  ];
}
