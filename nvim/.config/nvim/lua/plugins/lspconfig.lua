return {
	{
		"neovim/nvim-lspconfig",
		opts = {
			servers = {
				wgsl_analyzer = {},
			},
			inlay_hints = { enabled = false },
		},
	},
}
