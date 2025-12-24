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
    gcc
    go
    lazygit
    nodejs
    python3
    ripgrep
    rustup
    yazi
  ];

  xdg.configFile."nvim" = {
    source = config.lib.file.mkOutOfStoreSymlink "/home/amit/dotfiles/nvim/.config/nvim";
    recursive = true;
  };

  programs.bash = {
    enable = true;
  };
}
