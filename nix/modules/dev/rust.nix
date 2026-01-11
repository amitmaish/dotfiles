{pkgs, ...}: {
  home.packages = with pkgs; [
    bacon
    cargo-generate
    cargo-leptos
    cargo-sweep
    cargo-tauri
    cargo-workspaces
    leptosfmt
    rust-bin.stable.latest.default
    trunk
  ];
}
