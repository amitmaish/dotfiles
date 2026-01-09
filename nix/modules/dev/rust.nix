{pkgs, ...}: {
  home.packages = with pkgs; [
    # rust-bin
    bacon
    cargo-generate
    cargo-leptos
    cargo-sweep
    cargo-tauri
    cargo-workspaces
    leptosfmt
    trunk
  ];
}
