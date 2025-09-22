return {
	{
		"https://github.com/neovim/nvim-lspconfig",
	},
	{
		"mason-org/mason.nvim",
		opts = {
			ui = { border = "rounded" },
		},
	},
	{
		"https://github.com/mfussenegger/nvim-dap",
	},
	{
		"https://github.com/rcarriga/nvim-dap-ui",
		dependencies = { "https://github.com/mfussenegger/nvim-dap" },
	},
	{
		"mrcjkb/rustaceanvim",
		version = "^6", -- Recommended
		lazy = false, -- This plugin is already lazy
	},
	{
		"saecki/crates.nvim",
		tag = "stable",
		config = function()
			require("crates").setup({
				lsp = {
					enabled = true,
					actions = true,
					completion = true,
					hover = true,
				},
			})
		end,
	},
}
