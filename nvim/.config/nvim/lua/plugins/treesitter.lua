return {
	"nvim-treesitter/nvim-treesitter",
	branch = "master",
	dependencies = { "tadmccorkle/markdown.nvim" },
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
				additional_vim_regex_highlighting = { "markdown" },
			},
			ignore_install = {},
			incremental_selection = {
				enable = false,
			},
			markdown = {
				enable = true,
			},
		})
	end,
}
