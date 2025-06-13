return {
	{
		"neovim/nvim-lspconfig",
		---@class PluginLspOpts
		opts = {
			---@type lspconfig.options
			servers = {
				wgsl_analyzer = {},
			},
			setup = {
				prettier = function(client)
					if client.name == "prettier" then
						client.server_capabilities.documentFormattingProvider = true
					end
				end,
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
