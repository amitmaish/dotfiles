{pkgs, ...}: {
  home.packages = with pkgs; [
    arduino-cli
    arduino-ide
    arduino-language-server
  ];
}
