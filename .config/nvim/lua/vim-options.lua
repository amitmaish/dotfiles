vim.cmd("set noexpandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.wo.number = true

vim.g.mapleader = ","

vim.keymap.set("i", "jk", "<Esc>")

vim.keymap.set("n", "<S-h>", "0")
vim.keymap.set("n", "<S-l>", "$")
