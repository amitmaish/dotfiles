{pkgs, ...}:
pkgs.writeShellApplication {
  name = "dot";

  runtimeInputs = with pkgs; [
    alejandra
    git
    libnotify
  ];

  text = builtins.readFile ./dot.sh;
}
