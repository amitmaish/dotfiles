return {
	{
		"williamboman/mason.nvim",
		lazy = false,
		config = function()
			require("mason").setup()
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		lazy = false,
		opts = {
			auto_install = true,
		},
	},
	{
		"neovim/nvim-lspconfig",
		lazy = false,
		config = function()
			local capabilities = require("cmp_nvim_lsp").default_capabilities()

			require("lspconfig").lua_ls.setup({
				capabilities = capabilities,
				filetypes = { "lua" },
			})

			require("lspconfig").clangd.setup({
				capabilities = capabilities,
				filetypes = { "c", "cpp", "h", "hpp" },
			})

			-- require("lspconfig").pyright.setup({
			-- 	capabilities = capabilities,
			-- 	filetypes = { "python" },
			-- })
			--
			require("lspconfig").jedi_language_server.setup({
				capabilities = capabilities,
				filetypes = { "python" },
			})

			require("lspconfig").nil_ls.setup({ capabilities = capabilities })
			require("lspconfig").rnix.setup({ capabilities = capabilities })

			require("lspconfig").typos_lsp.setup({
				capabilities = capabilities,
				filetypes = { "text", "markdown", "latex" },
			})
			-- require("lspconfig").ltex.setup({ capabilities = capabilities})

			vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
			vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, {})
			vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, {})
			vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
			vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, {})
			vim.keymap.set("n", "<leader>qf", vim.diagnostic.setqflist, {})
			-- vim.keymap.set("n", "<C- >", vim.lsp.completion.trigger, {select = true})
		end,
	},
	{
		"mrcjkb/rustaceanvim",
		version = "^5", -- Recommended
		lazy = false, -- This plugin is already lazy
	},
}
