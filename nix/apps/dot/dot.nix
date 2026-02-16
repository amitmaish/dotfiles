{
  ncurses5,
  alejandra,
  git,
  libnotify,
  writeShellApplication,
  REBUILD_COMMAND ? "sudo nixos-rebuild switch --flake ~/dotfiles/nix",
  CURRENT_COMMAND ? ''nixos-rebuild list-generations | grep True | awk '{print $1}' '',
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
