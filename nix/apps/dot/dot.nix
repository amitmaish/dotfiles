{
  writeShellApplication,
  alejandra,
  doppler,
  git,
  libnotify,
  nushell,
  REBUILD_COMMAND ? "sudo nixos-rebuild switch --flake ~/dotfiles/nix",
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

  excludeShellChecks = [
    "SC2089"
    "SC2090"
  ];

  runtimeEnv = {inherit REBUILD_COMMAND;};

  text = builtins.readFile ./dot.sh;
}
