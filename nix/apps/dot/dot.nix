{pkgs, ...}:
pkgs.writeShellApplication {
  name = "dot";

  runtimeInputs = with pkgs; [
    alejandra
    git
    libnotify
    nushell
  ];

  text = builtins.readFile ./dot.sh;
}
