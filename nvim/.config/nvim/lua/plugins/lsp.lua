return {
	{
		"https://github.com/neovim/nvim-lspconfig",
	},
	{
		"mason-org/mason.nvim",
		---@type MasonSettings
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
}
