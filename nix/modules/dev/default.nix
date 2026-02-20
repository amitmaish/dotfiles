{
  pkgs,
  inputs,
  system,
  ...
}: {
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
    asmfmt
    ast-grep
    direnv
    doppler
    gh
    inputs.tree-sitter.packages.${system}.default
    kdePackages.qtdeclarative
    kdlfmt
    lazygit
    lldb
    marksman
    mdsf
    pkgconf
    ron-lsp
    topiary
    tree
    vscode-langservers-extracted
  ];
}
