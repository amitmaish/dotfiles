return {
	"stevearc/conform.nvim",
	opts = {
		formatters_by_ft = {
			assembly = { "asmfmt" },
			arduino = { "clang-format" },
			c = { "clang-format" },
			cpp = { "clang-format" },
			cs = { "clang-format" },
			go = { "gofumpt", "goimports" },
			haskell = { "ormolu" },
			html = { "prettier" },
			lua = { "stylua" },
			javascript = { "prettier", stop_after_first = true },
			json = { "prettier" },
			markdown = { "mdsf" },
			nix = { "alejandra" },
			python = { "ruff" },
			rust = { "rustfmt" },
			toml = { "taplo" },
			typescript = { "prettier" },
			typescriptreact = { "prettier" },
			zig = { lsp_format = "prefer" },
		},
		format_on_save = {
			lsp_format = "fallback",
		},
	},
}
