{
  writeShellApplication,
  alejandra,
  doppler,
  git,
  libnotify,
  nushell,
}:
writeShellApplication {
  name = "dot";

  runtimeInputs = [
    alejandra
    doppler
    git
    libnotify
    nushell
  ];

  text = builtins.readFile ./dot.sh;
}
