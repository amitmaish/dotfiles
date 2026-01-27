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
    rusty-man
    trunk
  ];
}
