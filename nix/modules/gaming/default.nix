{pkgs, ...}: {
  imports = [
    ./emulation.nix
  ];

  home.packages = with pkgs; [
    lutris
    steam
    prismlauncher
    protonup-ng
  ];
}
