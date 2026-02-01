{pkgs, ...}: {
  home.packages = with pkgs; [
    nickel
  ];
}
