return {
	"stevearc/conform.nvim",
	init = function()
		vim.keymap.set("n", "<leader>lf", require("conform").format)
		local autoformat = true
		vim.api.nvim_create_user_command("ConformToggle", function()
			autoformat = not autoformat
		end, { desc = "format file" })
		vim.api.nvim_create_autocmd("BufWritePre", {
			pattern = "*",
			callback = function()
				if autoformat then
					require("conform").format()
				end
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
