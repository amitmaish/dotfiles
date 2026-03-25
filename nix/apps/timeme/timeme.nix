{
  skim,
  timewarrior,
  tmux,
  writeShellApplication,
}:
writeShellApplication {
  name = "timeme";

  runtimeInputs = [
    skim
    timewarrior
    tmux
  ];

  text = builtins.readFile ./timeme.sh;
}
