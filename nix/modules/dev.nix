{pkgs, ...}: {
  imports = [
    ./dev/arduino.nix
    ./dev/bash.nix
    ./dev/c.nix
    ./dev/go.nix
    ./dev/haskell.nix
    ./dev/js.nix
    ./dev/lua.nix
    ./dev/nix.nix
    ./dev/python.nix
    ./dev/rust.nix
    ./dev/tex.nix
    ./dev/toml.nix
    ./dev/typst.nix
    ./dev/yaml.nix
    ./dev/zig.nix
  ];

  home.packages = with pkgs; [
    asm-lsp
    direnv
    doppler
    gh
    lazygit
    lldb
    pkgconf
    ron-lsp
    tree
  ];
}
