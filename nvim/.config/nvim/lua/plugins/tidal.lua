return {
	"thgrund/tidal.nvim",
	opts = {
		-- Your configuration here
		-- See configuration section for defaults
	},
	-- Recommended: Install TreeSitter parsers for Haskell and SuperCollider
	dependencies = {
		"nvim-treesitter/nvim-treesitter",
		opts = { ensure_installed = { "haskell", "supercollider" } },
	},
}
