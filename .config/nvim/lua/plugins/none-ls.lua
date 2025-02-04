return {
	"nvimtools/none-ls.nvim",

	config = function()
		local null_ls = require("null-ls")

		null_ls.setup({
			sources = {
				-- lua
				null_ls.builtins.formatting.stylua,

				-- prose
				-- null_ls.builtins.diagnostics.cspell,

				-- python
				null_ls.builtins.formatting.black,
				null_ls.builtins.diagnostics.pylint,

				-- rust
				null_ls.builtins.formatting.dxfmt,
			},
		})

		vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})
	end,
}
