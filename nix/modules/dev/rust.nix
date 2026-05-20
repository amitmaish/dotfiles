{pkgs, ...}: {
  home.packages = with pkgs;
    [
      (rust-bin.stable.latest.default.override {
        extensions = [
          "rust-analyzer"
          "rust-src"
        ];
      })
    ]
    ++ [
      bacon
      cargo-generate
      cargo-leptos
      cargo-sweep
      cargo-tauri
      cargo-workspaces
      leptosfmt
      ron-lsp
      rusty-man
      trunk
    ];
}
