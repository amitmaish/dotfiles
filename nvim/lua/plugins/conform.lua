return {
	"stevearc/conform.nvim",
	init = function()
		vim.keymap.set("n", "<leader>lf", require("conform").format, { desc = "format buffer" })
	end,
	---@type conform.setupOpts
	opts = {
		formatters_by_ft = {
			-- ron = { "ronfmt" },
			arduino = { "clang-format" },
			assembly = { "asmfmt" },
			bash = { "shfmt" },
			c = { "clang-format" },
			cmake = { "gersemi" },
			cpp = { "clang-format" },
			cs = { "clang-format" },
			go = { "gofumpt", "goimports" },
			haskell = { "ormolu" },
			html = { "prettier" },
			javascript = { "prettier", stop_after_first = true },
			json = { "prettier" },
			just = { lsp_format = "never" },
			kdl = { "kdlfmt" },
			lua = { "stylua" },
			markdown = { "mdsf", "prettier" },
			nickel = { lsp_format = "prefer" },
			nix = { "alejandra" },
			nu = { "nufmt" },
			python = { "ruff" },
			rust = { lsp_format = "prefer" },
			tex = { "tex-fmt" },
			tidal = { "ormolu" },
			toml = { "taplo" },
			typescript = { "prettier" },
			typescriptreact = { "prettier" },
			typst = { "prettypst", "typstyle" },
			zig = { lsp_format = "prefer" },
		},
		format_on_save = function(bufnr)
			if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
				return
			end
			return { lsp_fallback = true }
		end,
	},
}
