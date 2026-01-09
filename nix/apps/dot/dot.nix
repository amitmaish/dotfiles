{pkgs, ...}:
pkgs.writeShellApplication {
  name = "dot";

  runtimeInputs = with pkgs; [
    alejandra
    doppler
    git
    libnotify
    nushell
  ];

  text = builtins.readFile ./dot.sh;
}
