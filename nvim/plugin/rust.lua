vim.pack.add({
	"https://github.com/mrcjkb/rustaceanvim",
	{
		src = "https://github.com/saecki/crates.nvim",
		tag = "stable",
	},
})

require("crates").setup({
	lsp = {
		enabled = true,
		actions = true,
		completion = true,
		hover = true,
	},
})
