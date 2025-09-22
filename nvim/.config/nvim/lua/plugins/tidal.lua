return {
	{
		"thgrund/tidal.nvim",
		opts = {},
		-- Recommended: Install TreeSitter parsers for Haskell and SuperCollider
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
			opts = { ensure_installed = { "haskell", "supercollider" } },
		},
	},
	{
		"thgrund/tidal-makros.nvim",
		config = function()
			require("makros").setup()
		end,
	},
}
