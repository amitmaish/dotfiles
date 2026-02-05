{
  config,
  lib,
  pkgs,
  ...
}: let
  dot = pkgs.callPackage ../../apps/dot/dot.nix {
    NAME = "amit-mbp";
    REBUILD_COMMAND = ''nh darwin switch ~/dotfiles/nix -H amit-mbp'';
    CURRENT_COMMAND = ''sudo darwin-rebuild --list-generations | grep "current" | awk '{print $1}' '';
    NOTIFY_COMMAND = ''terminal-notifier -group dot -title dot -message "rebuild successful!" '';
  };
  configPath = "/Users/amit/dotfiles/";
  mkMutableSymlink = path: config.lib.file.mkOutOfStoreSymlink (configPath + lib.strings.removePrefix (toString ../../../.) (toString path));
in {
  home.username = "amit";

  home.stateVersion = "25.05";

  imports = [
    ../../modules/apps.nix
    ../../modules/cli.nix
    ../../modules/dev
    ../../modules/fonts.nix
    ../../modules/gaming
  ];

  emulation.enable = false;

  home.packages = with pkgs; [
    dot
    m-cli
    swiftbar
    terminal-notifier
    xorg.xorgserver

    (writeShellApplication {
      name = "sclang";
      text = ''/Applications/SuperCollider.app/Contents/MacOS/sclang '';
    })
  ];

  programs.aerospace = {
    enable = true;
    launchd.enable = true;
  };

  programs.firefox.enable = true;

  programs.nh = {
    enable = true;
    clean.enable = true;
    clean.extraArgs = "--keep-since 7d";
    flake = "~/dotfiles/nix";
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

  home.file.".config/bat".source = mkMutableSymlink ../../../bat/.config/bat;
  home.file.".config/ghostty".source = mkMutableSymlink ../../../ghostty/.config/ghostty;
  home.file.".config/nvim".source = mkMutableSymlink ../../../nvim/.config/nvim;
  home.file.".config/starship.toml".source = mkMutableSymlink ../../../starship/.config/starship.toml;
  home.file.".config/swiftbar".source = mkMutableSymlink ../../../swiftbar;
  home.file.".config/yazi".source = mkMutableSymlink ../../../yazi/.config/yazi;
  home.file.".config/.tmux.conf".source = mkMutableSymlink ../../../tmux/.tmux.conf;

  services.syncthing.enable = true;

  services.jankyborders = {
    enable = true;
    settings = {
      style = "round";
      width = 3.0;
      hidpi = "on";
      active_color = "0xffffd2e3";
      inactive_color = "0x00000000";
    };
  };
}
