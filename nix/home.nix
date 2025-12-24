{
  config,
  pkgs,
  ...
}: {
  home.username = "amit";
  home.homeDirectory = "/home/amit";
  home.stateVersion = "25.05";

  home.packages = with pkgs; [
    cargo-generate
    cargo-sweep
    direnv
    eza
    fuzzel
    fzf
    gcc
    gh
    go
    lazygit
    nodejs
    python3
    quickshell
    ripgrep
    rustup
    starship
    swaybg
    swaylock
    tlrc
    waybar
    yazi
    zoxide

    blender
    discord
    pureref
    steam
  ];

  programs.git = {
    enable = true;
    userEmail = "amit.maish1@gmail.com";
    userName = "amit";
  };

  programs.fish = {
    enable = true;
    functions = {
      y = {
        body = ''
          set tmp (mktemp -t "yazi-cwd.XXXXXX")
          yazi $argv --cwd-file="$tmp"
          if read -z cwd <"$tmp"; and [ -n "$cwd" ]; and [ "$cwd" != "$PWD" ]
          	builtin cd -- "$cwd"
          end
          rm -f -- "$tmp"
        '';
      };
    };
    shellAliases = {
      ls = "eza";
    };
    shellInit = ''
      direnv hook fish | source
      fzf --fish | source
      zoxide init fish --cmd cd | source

      starship init fish | source
    '';
  };

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
}
