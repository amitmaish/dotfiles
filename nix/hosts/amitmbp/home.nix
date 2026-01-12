{
  config,
  pkgs,
  ...
}: let
  dot = pkgs.callPackage ../../apps/dot/dot.nix {
    NAME = "amit-mbp";
    REBUILD_COMMAND = ''nh darwin switch ~/dotfiles/nix -H amit-mbp'';
    CURRENT_COMMAND = ''darwin-rebuild --list-generations | grep "current" | awk '{print $1}' '';
  };
in {
  home.username = "amit";

  home.stateVersion = "25.05";

  imports = [
    ../../modules/apps.nix
    # ../../modules/gaming
    ../../modules/cli.nix
    ../../modules/dev
  ];

  # emulation.enable = false;

  home.packages = with pkgs; [
    dot
    p7zip
    zip
  ];

  programs.aerospace = {
    enable = true;
  };

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
      core = {
        pager = "delta";
      };
    };
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
    shellInit = ''
      direnv hook fish | source
      fzf --fish | source
      zoxide init fish --cmd cd | source

      starship init fish | source
    '';
  };

  home.file.".config/starship.toml".source = ../../../starship/.config/starship.toml;

  home.file.".config/yazi" = {
    source = ../../../yazi/.config/yazi;
    recursive = true;
  };

  xdg.configFile."bat" = {
    source = config.lib.file.mkOutOfStoreSymlink ../../../bat/.config/bat;
    recursive = true;
  };
  xdg.configFile."ghostty" = {
    source = config.lib.file.mkOutOfStoreSymlink ../../../ghostty/.config/ghostty;
    recursive = true;
  };
  xdg.configFile."nvim" = {
    source = config.lib.file.mkOutOfStoreSymlink ../../../nvim/.config/nvim;
    recursive = true;
  };
  programs.neovim = {
    enable = true;
    defaultEditor = true;
  };

  services.syncthing.enable = true;
}
