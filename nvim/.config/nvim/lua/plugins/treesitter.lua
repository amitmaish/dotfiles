return {
	"https://github.com/nvim-treesitter/nvim-treesitter",
	branch = "master",
	lazy = false,
	build = ":TSUpdate",
	config = function()
		require("nvim-treesitter.configs").setup({
			modules = {},
			ensure_installed = {},
			auto_install = true,
			sync_install = false,
			highlight = {
				enable = true,
			},
			ignore_install = {},
			incremental_selection = {
				enable = false,
			},
		})
	end,
}
