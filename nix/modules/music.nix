{pkgs, ...}: {
  home.packages = with pkgs; [
    reaper
    supercollider
    surge-XT
  ];
}
