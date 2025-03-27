return {
	{
		"neovim/nvim-lspconfig",
		---@class PluginLspOpts
		opts = {
			---@type lspconfig.options
			servers = {
				-- arduino_language_server = {},
				glslls = {},
			},
			inlay_hints = { enabled = false },
		},
	},
}
