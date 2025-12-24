{
  config,
  pkgs,
  ...
}: {
  home.username = "amit";
  home.homeDirectory = "/home/amit";
  home.stateVersion = "25.05";

  home.packages = with pkgs; [
    fzf
    fuzzel
    gcc
    go
    lazygit
    nodejs
    python3
    ripgrep
    rustup
    swaybg
    swaylock
    yazi
  ];

  xdg.configFile."niri" = {
    source = config.lib.file.mkOutOfStoreSymlink "/home/amit/dotfiles/niri";
    recursive = true;
  };
  xdg.configFile."nvim" = {
    source = config.lib.file.mkOutOfStoreSymlink "/home/amit/dotfiles/nvim/.config/nvim";
    recursive = true;
  };
}
