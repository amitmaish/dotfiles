return {
	"nvim-treesitter/nvim-treesitter",
	branch = "main",
	lazy = false,
	build = ":TSUpdate",
	opts = {
		modules = {},
		ensure_installed = {},
		auto_install = true,
		sync_install = false,
		install_dir = vim.fn.stdpath("data") .. "/site",
		highlight = {
			enable = true,
			additional_vim_regex_highlighting = { "markdown" },
		},
		ignore_install = {},
		incremental_selection = {
			enable = false,
		},
		markdown = {
			enable = true,
		},
	},
}
