return {
	{
		"neovim/nvim-lspconfig",
		---@class PluginLspOpts
		opts = {
			---@type lspconfig.options
			servers = {
				wgsl_analyzer = {},
			},
			inlay_hints = { enabled = false },
		},
	},
	{
		"williamboman/mason.nvim",
		opts = {
			ensure_installed = {
				"prettier",
				"wgsl-analyzer",
			},
		},
	},
}
