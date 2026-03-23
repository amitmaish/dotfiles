{pkgs, ...}: {
  home.packages = with pkgs; [
    nufmt
    nushellPlugins.skim
  ];
}
