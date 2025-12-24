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
    quickshell
    ripgrep
    rustup
    swaybg
    swaylock
    waybar
    yazi
    zoxide

    blender
    discord
    pureref
    steam
  ];

  xdg.configFile."ghostty" = {
    source = config.lib.file.mkOutOfStoreSymlink "/home/amit/dotfiles/ghostty/.config/ghostty/";
    recursive = true;
  };
  xdg.configFile."niri" = {
    source = config.lib.file.mkOutOfStoreSymlink "/home/amit/dotfiles/niri";
    recursive = true;
  };
  xdg.configFile."nvim" = {
    source = config.lib.file.mkOutOfStoreSymlink "/home/amit/dotfiles/nvim/.config/nvim";
    recursive = true;
  };
  xdg.configFile."quickshell" = {
    source = config.lib.file.mkOutOfStoreSymlink "/home/amit/dotfiles/quickshell";
    recursive = true;
  };
}
