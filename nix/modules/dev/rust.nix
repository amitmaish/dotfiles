{pkgs, ...}: {
  home.packages = with pkgs; [
    bacon
    cargo-generate
    cargo-leptos
    cargo-sweep
    cargo-tauri
    cargo-workspaces
    leptosfmt
    ron-lsp
    rust-bin.stable.latest.default
    rust-bin.stable.latest.rust-analyzer
    rust-bin.stable.latest.rust-src
    rusty-man
    trunk
  ];
}
