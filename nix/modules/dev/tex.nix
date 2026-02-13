{pkgs, ...}: {
  home.packages = with pkgs; [
    tex-fmt
    texlab
    texliveMedium
  ];
}
