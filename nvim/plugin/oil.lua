vim.pack.add({
	"https://github.com/echasnovski/mini.icons",
	"https://github.com/stevearc/oil.nvim",
})

require("mini.icons").setup()
require("oil").setup()

require("which-key").add({
	{
		"<leader>o",
		function()
			vim.cmd("Oil")
		end,
		desc = "oil",
	},
})
