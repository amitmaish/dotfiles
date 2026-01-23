{pkgs, ...}: {
  home.packages = with pkgs; [
    bear
    clang-tools
    cmake
    gcc
  ];
}
