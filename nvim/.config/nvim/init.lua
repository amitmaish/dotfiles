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

vim.keymap.set("i", "jk", "<esc>")
vim.keymap.set({ "n", "v" }, "H", "^")
vim.keymap.set({ "n", "v" }, "L", "$")
vim.keymap.set("n", "<leader>qq", ":qa<cr>")

vim.keymap.set("n", "<c-h>", "<c-w>h")
vim.keymap.set("n", "<c-j>", "<c-w>j")
vim.keymap.set("n", "<c-k>", "<c-w>k")
vim.keymap.set("n", "<c-l>", "<c-w>l")

require("config.lazy")

require("digraphs")

vim.keymap.set("n", "<leader>so", ":so<CR>", { desc = "source file" })

vim.cmd.colorscheme("catppuccin")
vim.cmd("hi statusline guibg=NONE")

local snacks = require("snacks")

vim.keymap.set("n", "<leader>gg", function()
	snacks.lazygit()
end, { desc = "lazygit" })

require("which-key").add({
	{ "<leader>", group = "leader" },
	{ "<leader>c", group = "code" },
	{ "<leader>g", group = "go" },
	{ "<leader>p", group = "pick" },
	{ "<leader>t", group = "tidal" },
	{ "<leader>q", group = "quit" },
	{ "gr", group = "lsp" },
	{ "gs", group = "surround" },
	{ "z", group = "fold" },
})

if vim.g.neovide then
	vim.g.neovide_cursor_animation_length = 0
end
