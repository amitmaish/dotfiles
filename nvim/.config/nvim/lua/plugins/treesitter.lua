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
			},
			ignore_install = {},
			incremental_selection = {
				enable = false,
			},
			markdown = {
				enable = true,
			},
			on_attach = function(bufnr)
				local map = vim.keymap.set
				local opts = { buffer = bufnr }
				map({ "n", "i" }, "<c-i><c-o>", "<Cmd>MDListItemBelow<CR>", opts)
				map({ "n", "i" }, "<c-I><c-O>", "<Cmd>MDListItemAbove<CR>", opts)
				map("n", "<c-c>", "<Cmd>MDTaskToggle<CR>", opts)
				map("x", "<c-c>", ":MDTaskToggle<CR>", opts)
			end,
		})
	end,
}
