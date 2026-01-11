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

  runtimeEnv = {inherit REBUILD_COMMAND;};

  excludeShellChecks = [
    "SC2089"
    "SC2090"
  ];

  text = builtins.readFile ./dot.sh;
}
