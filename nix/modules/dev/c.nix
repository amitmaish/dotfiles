{pkgs, ...}: {
  home.packages = with pkgs; [
    clang-tools
    cmake
    gcc
  ];
}
