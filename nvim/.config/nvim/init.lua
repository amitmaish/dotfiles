require("config.lazy")
require("digraphs")
require("neovide")

vim.o.number = true
vim.o.relativenumber = true
vim.o.signcolumn = "yes"
vim.o.tabstop = 2
vim.o.shiftwidth = 2
vim.o.expandtab = false
vim.o.swapfile = false
vim.o.winborder = "rounded"
vim.o.syntax = "disable"
vim.o.spell = true
vim.o.spellcapcheck = ""
vim.o.linebreak = true

vim.g.mapleader = " "

local wk = require("which-key")

local navWrap = false
local notNavWrap = function()
	return not navWrap
end
wk.add({
	{ "jk", "<esc>", mode = { "i" }, hidden = true },
	{ "H", "^", mode = { "n", "v" }, hidden = true, cond = notNavWrap },
	{ "L", "$", mode = { "n", "v" }, hidden = true, cond = notNavWrap },
	{ "<leader>qq", ":qa<cr>", desc = "quit" },
	{ "<leader>qQ", ":qa!<cr>", desc = "quit without saving" },

	-- navWrap
	{
		"<leader>uw",
		function()
			navWrap = not navWrap
		end,
		desc = "toggle navigation line wrap",
		icon = function()
			if navWrap then
				return "󰨚"
			end
			return "󰨙"
		end,
	},
	{ "h", "gh", mode = { "i", "v" }, hidden = true, cond = navWrap },
	{ "j", "gj", mode = { "i", "v" }, hidden = true, cond = navWrap },
	{ "k", "gk", mode = { "i", "v" }, hidden = true, cond = navWrap },
	{ "l", "gl", mode = { "i", "v" }, hidden = true, cond = navWrap },
	{ "H", "g^", mode = { "i", "v" }, hidden = true, cond = navWrap },
	{ "L", "g$", mode = { "i", "v" }, hidden = true, cond = navWrap },

	{ "<c-h>", "<c-w>h", hidden = true },
	{ "<c-j>", "<c-w>j", hidden = true },
	{ "<c-k>", "<c-w>k", hidden = true },
	{ "<c-l>", "<c-w>l", hidden = true },

	{ "<leader>so", ":so<CR>", desc = "source file" },
})

vim.cmd.colorscheme("catppuccin")
vim.cmd("hi statusline guibg=NONE")
