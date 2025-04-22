return {
	{
		"neovim/nvim-lspconfig",
		opts = {
			servers = {
				arduino_language_server = {},
				clangd = {
					mason = false,
				},
				wgsl_analyzer = {},
			},
			inlay_hints = { enabled = false },
		},
	},
}
