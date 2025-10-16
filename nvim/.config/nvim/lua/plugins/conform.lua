return {
	"stevearc/conform.nvim",
	init = function()
		vim.keymap.set("n", "<leader>lf", require("conform").format, { desc = "format buffer" })
		local wk = require("which-key")
		local autoformat = true

		local conform_group = vim.api.nvim_create_augroup("conform", { clear = true })

		wk.add({
			"<leader>uf",
			function()
				autoformat = not autoformat
				if autoformat then
					vim.api.nvim_create_autocmd("BufWritePre", {
						group = conform_group,
						pattern = "*",
						callback = function()
							require("conform").format()
						end,
					})
				else
					vim.api.nvim_clear_autocmds({ group = conform_group })
				end
			end,

			desc = "toggle autoformating",
			icon = function()
				if autoformat then
					return "󰨚"
				end
				return "󰨙"
			end,
		})
	end,
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
			markdown = { "mdsf", "prettier" },
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
