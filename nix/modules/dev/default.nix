{
  pkgs,
  inputs,
  system,
  ...
}: {
  imports = [
    ./arduino.nix
    ./bash.nix
    ./c.nix
    ./go.nix
    ./haskell.nix
    ./js.nix
    ./just.nix
    ./lua.nix
    ./nickel.nix
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
    direnv
    doppler
    gh
    git-credential-manager
    gnumake
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
