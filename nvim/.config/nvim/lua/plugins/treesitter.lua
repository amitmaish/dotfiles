return {
	"https://github.com/nvim-treesitter/nvim-treesitter",
	branch = "master",
	lazy = false,
	build = ":TSUpdate",
	opts = {
		modules = {},
		auto_install = true,
		sync_install = false,
		ensure_installed = {},
		highlight = {
			enable = true,
		},
		ignore_install = {},
		incremental_selection = {
			enable = false,
		},
	},
}
