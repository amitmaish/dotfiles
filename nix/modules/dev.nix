{pkgs, ...}: {
  imports = [
    ./dev/arduino.nix
    ./dev/c.nix
    ./dev/go.nix
    ./dev/haskell.nix
    ./dev/js.nix
		./dev/lua.nix
    ./dev/nix.nix
    ./dev/python.nix
    ./dev/rust.nix
    ./dev/tex.nix
    ./dev/typst.nix
    ./dev/yaml.nix
    ./dev/zig.nix
  ];

  home.packages = with pkgs; [
    doppler
    direnv
    gh
    lazygit
    lldb
    pkgconf
  ];
}
