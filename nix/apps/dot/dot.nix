{
  ncurses5,
  alejandra,
  git,
  libnotify,
  writeShellApplication,
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
    ncurses5
  ];

  excludeShellChecks = [
    "SC2016"
    "SC2089"
    "SC2090"
  ];

  runtimeEnv = {inherit REBUILD_COMMAND CURRENT_COMMAND NAME NOTIFY_COMMAND;};

  text = builtins.readFile ./dot.sh;
}
