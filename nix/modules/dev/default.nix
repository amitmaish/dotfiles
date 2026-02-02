{pkgs, ...}: {
  imports = [
    ./nickel.nix
    ./arduino.nix
    ./bash.nix
    ./c.nix
    ./go.nix
    ./haskell.nix
    ./js.nix
    ./lua.nix
    ./nix.nix
    ./python.nix
    ./rust.nix
    ./tex.nix
    ./toml.nix
    ./typst.nix
    ./yaml.nix
    ./zig.nix
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
    topiary
    tree
    tree-sitter
  ];
}
