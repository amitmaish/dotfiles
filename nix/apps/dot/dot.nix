{
  writeShellApplication,
  alejandra,
  git,
  libnotify,
  nushell,
  REBUILD_COMMAND ? "sudo nixos-rebuild switch --flake ~/dotfiles/nix",
  NAME ? "nix",
}:
writeShellApplication {
  name = "dot";

  runtimeInputs = [
    alejandra
    git
    libnotify
    nushell
  ];

  runtimeEnv = {inherit NAME REBUILD_COMMAND;};

  excludeShellChecks = [
    "SC2089"
    "SC2090"
  ];

  text = builtins.readFile ./dot.sh;
}
