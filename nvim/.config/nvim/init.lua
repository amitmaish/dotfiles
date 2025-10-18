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
vim.o.undofile = true
vim.o.winborder = "rounded"
vim.o.syntax = "disable"
vim.o.spell = true
vim.o.spellcapcheck = ""
vim.o.linebreak = true
vim.o.showmode = false

vim.g.mapleader = " "

WK = require("which-key")
Snacks = require("snacks")

Snacks.toggle
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
UpdateNavWrap = function()
	WK.add({
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
UpdateNavWrap()
Snacks.toggle
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
			UpdateNavWrap()
		end,
	})
	:map("<leader>uw")

WK.add({
	{ "jk", "<esc>", mode = { "i" }, hidden = true },
	{ "<leader>qq", ":qa<cr>", desc = "quit" },
	{ "<leader>qQ", ":qa!<cr>", desc = "quit without saving" },

	{ "<c-h>", "<c-w>h", hidden = true },
	{ "<c-j>", "<c-w>j", hidden = true },
	{ "<c-k>", "<c-w>k", hidden = true },
	{ "<c-l>", "<c-w>l", hidden = true },

	{ "<leader>so", ":so<CR>", desc = "source file" },

	{
		"gd",
		vim.lsp.buf.definition,
		desc = "go to definition",
	},
	{ "<leader>ca", vim.lsp.buf.code_action, desc = "code action" },
	{ "<leader>cr", vim.lsp.buf.rename, desc = "lsp rename" },
	{
		"<leader>cd",
		require("telescope.builtin").diagnostics,
		desc = "Pick diagnostics",
	},
})

vim.cmd.colorscheme("catppuccin")
