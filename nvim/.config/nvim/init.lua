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
local snacks = require("snacks")

snacks.toggle
	.new({
		id = "autoformat",
		name = "autoformat",
		get = function()
			return not vim.g.disable_autoformat
		end,
		set = function(state)
			vim.g.disable_autoformat = not state
		end,
	})
	:map("<leader>uf")

NavWrap = false
local updateNavWrap = function()
	wk.add({
		{
			mode = { "n", "v" },
			hidden = true,
			cond = NavWrap,
			{ "j", "gj" },
			{ "k", "gk" },
			{ "H", "g^" },
			{ "L", "g$" },
		},
		{
			mode = { "n", "v" },
			hidden = true,
			cond = not NavWrap,
			{ "H", "^" },
			{ "L", "$" },
		},
	})
end
updateNavWrap()
snacks.toggle
	.new({
		id = "navWrap",
		name = "navWrap",
		get = function()
			return NavWrap
		end,
		set = function(state)
			NavWrap = state
			if not NavWrap then
				vim.keymap.del({ "n", "v" }, "j")
				vim.keymap.del({ "n", "v" }, "k")
			end
			updateNavWrap()
		end,
	})
	:map("<leader>uw")

wk.add({
	{ "jk", "<esc>", mode = { "i" }, hidden = true },
	{ "<leader>qq", ":qa<cr>", desc = "quit" },
	{ "<leader>qQ", ":qa!<cr>", desc = "quit without saving" },

	{ "<c-h>", "<c-w>h", hidden = true },
	{ "<c-j>", "<c-w>j", hidden = true },
	{ "<c-k>", "<c-w>k", hidden = true },
	{ "<c-l>", "<c-w>l", hidden = true },

	{ "<leader>so", ":so<CR>", desc = "source file" },
})

vim.cmd.colorscheme("catppuccin")
vim.cmd("hi statusline guibg=NONE")
