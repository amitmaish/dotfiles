{pkgs, ...}: {
  home.packages = with pkgs; [
    pianoteq.standard_8
    reaper
    supercollider
  ];
}
