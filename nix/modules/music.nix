{pkgs, ...}: {
  home.packages = with pkgs; [
    pianoteq.standard_8
    reaper
    supercollider
    surge-XT
  ];

  home.file.".lv2/Pianoteq 8.lv2".source = "${pkgs.pianoteq.standard_8}/bin/Pianoteq 8.lv2";
}
