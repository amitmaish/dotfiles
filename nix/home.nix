{
  config,
  pkgs,
  ...
}: let
  hayase = import ./apps/hayase.nix {inherit pkgs;};
in {
  home.username = "amit";
  home.homeDirectory = "/home/amit";
  home.stateVersion = "25.05";

  home.packages = with pkgs; [
    bat
    cargo-generate
    cargo-sweep
    cargo-workspaces
    direnv
    eza
    fzf
    gcc
    gh
    go
    lazygit
    lldb
    neofetch
    nodejs
    pkgconf
    python3
    quickshell
    ripgrep
    starship
    syncthing
    tlrc
    typst
    usbutils
    waybar
    yazi
    zoxide

    asm-lsp
    haskell-language-server
    ron-lsp

    (blender.override {
      cudaSupport = true;
    })

    anki
    calibre
    discord
    hayase
    pureref
    reaper
    signal-desktop
    thunderbird
    zapzap

    bottles
    cemu
    lutris
    steam
    prismlauncher
    protonup-ng
    ukmm
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
      cat = "bat";
      dot = "sudo nixos-rebuild switch --flake ~/dotfiles/nix#amit";
      ls = "eza";
    };
    shellInit = ''
      direnv hook fish | source
      fzf --fish | source
      zoxide init fish --cmd cd | source

      starship init fish | source
    '';
  };

  home.file.".config/starship.toml".source = ../starship/.config/starship.toml;

  xdg.configFile."ghostty" = {
    source = config.lib.file.mkOutOfStoreSymlink ../ghostty/.config/ghostty;
    recursive = true;
  };
  xdg.configFile."niri" = {
    source = config.lib.file.mkOutOfStoreSymlink ../niri;
    recursive = true;
  };
  xdg.configFile."noctalia" = {
    source = config.lib.file.mkOutOfStoreSymlink ../noctalia;
    recursive = true;
  };
  xdg.configFile."nvim" = {
    source = config.lib.file.mkOutOfStoreSymlink ../nvim/.config/nvim;
    recursive = true;
  };

  xdg.mimeApps = {
    enable = true;
    defaultApplications = {
      "application/x-blender" = "blender";
    };
  };

  services.udiskie = {
    enable = true;
    settings = {
      program_options = {
        file_manager = "${pkgs.kdePackages.dolphin}";
      };
    };
  };
}
