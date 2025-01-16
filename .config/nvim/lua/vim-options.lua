vim.cmd("set noexpandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.wo.number = true

vim.g.mapleader = ","

vim.keymap.set("i", "jk", "<Esc>")

vim.keymap.set("n", "<S-h>", "0")
vim.keymap.set("n", "<S-l>", "$")

-- Navigate vim panes better
vim.keymap.set("n", "<C-h>", ":wincmd h<CR>", { silent = true })
vim.keymap.set("n", "<C-j>", ":wincmd j<CR>", { silent = true })
vim.keymap.set("n", "<C-k>", ":wincmd k<CR>", { silent = true })
vim.keymap.set("n", "<C-l>", ":wincmd l<CR>", { silent = true })
