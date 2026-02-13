{
  config,
  lib,
  pkgs,
  ...
}: let
  configPath =
    if pkgs.stdenv.isDarwin
    then "/Users/amit/dotfiles/"
    else "/home/amit/dotfiles/";
  mkMutableSymlink = path: config.lib.file.mkOutOfStoreSymlink (configPath + lib.strings.removePrefix (toString ../../../.) (toString path));
in {
  imports = [
    ../../modules/apps.nix
    ../../modules/art.nix
    ../../modules/cli.nix
    ../../modules/dev
    ../../modules/fonts.nix
    ../../modules/gaming
    ../../modules/music.nix
  ];

  programs.nh = {
    enable = true;
    clean.enable = true;
    clean.extraArgs = "--keep-since 7d";
    flake = "~/dotfiles/nix";
  };

  programs.ghostty = {
    enable = true;
    enableBashIntegration = true;
    enableFishIntegration = true;
    enableZshIntegration = true;
  };

  programs.git = {
    enable = true;
    lfs.enable = true;
    settings = {
      user = {
        email = "amit.maish1@gmail.com";
        name = "amit";
      };
      init.defaultBranch = "main";
    };
  };

  programs.delta = {
    enable = true;
    enableGitIntegration = true;
  };

  programs.direnv = {
    enable = true;
    enableBashIntegration = true;
    enableFishIntegration = true;
    enableNushellIntegration = true;
    enableZshIntegration = true;
  };

  programs.fzf = {
    enable = true;
    enableBashIntegration = true;
    enableFishIntegration = true;
    enableZshIntegration = true;
  };

  programs.zoxide = {
    enable = true;
    enableBashIntegration = true;
    enableFishIntegration = true;
    enableNushellIntegration = true;
    enableZshIntegration = true;
    options = ["--cmd cd"];
  };

  programs.starship = {
    enable = true;
    enableBashIntegration = true;
    enableFishIntegration = true;
    enableNushellIntegration = true;
    enableZshIntegration = true;
  };

  programs.fish = {
    enable = true;
    functions = {
      s = {
        body = ''
          sesh connect "$(
          sesh list --icons | sk --tmux 90%,90% \
          	--no-sort --ansi --prompt '⚡  ' \
          	--header '  ^a all ^t tmux ^g configs ^x zoxide ^d tmux kill ^f find' \
          	--bind 'tab:down,btab:up' \
          	--bind 'ctrl-a:change-prompt(⚡  )+reload(sesh list --icons)' \
          	--bind 'ctrl-t:change-prompt(🪟  )+reload(sesh list -t --icons)' \
          	--bind 'ctrl-g:change-prompt(    )+reload(sesh list -c --icons)' \
          	--bind 'ctrl-x:change-prompt(📁  )+reload(sesh list -z --icons)' \
          	--bind 'ctrl-f:change-prompt(🔎  )+reload(fd -H -d 2 -t d -E .Trash . ~)' \
          	--bind 'ctrl-d:execute(tmux kill-session -t {2..})+change-prompt(⚡  )+reload(sesh list --icons)' \
          	--preview-window 'right:55%' \
          	--preview 'sesh preview {}' \
              )"
        '';
      };
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
      cat = "bat";
      ls = "eza";
      man = "batman";
    };
  };

  programs.nushell.enable = true;

  programs.neovim = {
    enable = true;
    defaultEditor = true;
  };

  programs.neovide = {
    enable = true;
    settings = {
      frame = "transparent";
    };
  };

  home.file.".config/aerospace".source = mkMutableSymlink ../../../aerospace/.config/aerospace;
  home.file.".config/bat".source = mkMutableSymlink ../../../bat/.config/bat;
  home.file.".config/ghostty".source = mkMutableSymlink ../../../ghostty/.config/ghostty;
  home.file.".config/niri".source = mkMutableSymlink ../../../niri;
  home.file.".config/noctalia".source = ../../../noctalia;
  home.file.".config/nvim".source = mkMutableSymlink ../../../nvim/.config/nvim;
  home.file.".config/qutebrowser".source = ../../../qutebrowser;
  home.file.".config/scripts".source = mkMutableSymlink ../../../scripts/scripts;
  home.file.".config/sesh".source = mkMutableSymlink ../../../sesh;
  home.file.".config/starship.toml".source = mkMutableSymlink ../../../starship/.config/starship.toml;
  home.file.".config/swiftbar".source = mkMutableSymlink ../../../swiftbar;
  home.file.".config/winapps/winapps.conf".source = mkMutableSymlink ../../../winapps/winapps.conf;
  home.file.".config/yazi".source = mkMutableSymlink ../../../yazi/.config/yazi;
  home.file.".tmux.conf".source = mkMutableSymlink ../../../tmux/.tmux.conf;
}
