vim.pack.add({ "https://github.com/folke/snacks.nvim" })

require("snacks").setup({
	bigfile = { enabled = true },
	dashboard = { enabled = false },
	explorer = { enabled = false },
	image = {
		enabled = false,
		convert = {
			magick = {
				vector = { "-background", "-none", "-density", 256, "{src}[{page}]" },
			},
		},
	},
	indent = { enabled = false },
	input = { enabled = true },
	picker = { enabled = false },
	notifier = { enabled = true },
	notify = { enabled = true },
	quickfile = { enabled = true },
	scope = { enabled = true },
	scroll = { enabled = false },
	---@type snacks.terminal.Config
	statuscolumn = { enabled = false },
	words = { enabled = false },
})

WK.add({
	{
		"<leader>gg",
		function()
			Snacks.lazygit()
		end,
		{ desc = "lazygit" },
	},
	{
		"<leader>.",
		function()
			Snacks.scratch()
		end,
		desc = "Toggle Scratch Buffer",
	},
	{
		"<leader>S",
		function()
			Snacks.scratch.select()
		end,
		desc = "Select Scratch Buffer",
	},
})
