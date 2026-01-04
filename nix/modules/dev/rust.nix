{pkgs, ...}: {
  home.packages = with pkgs; [
    cargo-generate
    cargo-sweep
    cargo-workspaces
    # rust-bin
  ];
}
