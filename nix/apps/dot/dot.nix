{
  writeShellApplication,
  alejandra,
  git,
  libnotify,
  nushell,
  REBUILD_COMMAND ? "sudo nixos-rebuild switch --flake ~/dotfiles/nix",
  CURRENT_COMMAND ? ''nu -c "nixos-rebuild list-generations | detect columns | where {|item| \$item.Current == True} | \$in.Generation.0"'',
  NAME ? "nix",
  NOTIFY_COMMAND ? ''notify-send -e "nixos rebuild ok!" -a "dot" --icon=software-update-available '',
}:
writeShellApplication {
  name = "dot";

  runtimeInputs = [
    alejandra
    git
    libnotify
    nushell
  ];

  runtimeEnv = {inherit NAME REBUILD_COMMAND CURRENT_COMMAND NOTIFY_COMMAND;};

  excludeShellChecks = [
    "SC2016"
    "SC2089"
    "SC2090"
  ];

  text = builtins.readFile ./dot.sh;
}
