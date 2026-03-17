return {
	{
		"mrcjkb/rustaceanvim",
		lazy = false,
	},
	{
		"saecki/crates.nvim",
		tag = "stable",
		---@type crates.UserConfig
		opts = {
			lsp = {
				enabled = true,
				actions = true,
				completion = true,
				hover = true,
			},
		},
	},
}
