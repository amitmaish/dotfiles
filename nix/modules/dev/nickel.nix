{pkgs, ...}: {
  home.packages = with pkgs; [
    nls
    nickel
  ];
}
