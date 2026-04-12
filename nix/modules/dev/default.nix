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
    ./nu.nix
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
    gnumake
    inputs.tree-sitter.packages.${system}.default
    kdePackages.qtdeclarative
    kdlfmt
    lldb
    marksman
    mdsf
    pkgconf
    ron-lsp
    topiary
    tree
    vscode-langservers-extracted
  ];

  programs.gitui.enable = true;

  programs.lazygit = {
    enable = true;

    enableBashIntegration = true;
    enableFishIntegration = true;
    enableNushellIntegration = true;
    enableZshIntegration = true;
  };
}
