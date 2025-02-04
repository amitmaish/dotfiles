vim.cmd("set noexpandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.wo.number = true

vim.cmd("set wrap linebreak")
vim.keymap.set("n", "∆", "gj")
vim.keymap.set("n", "˚", "gk")
vim.keymap.set("n", "˙", "g^")
vim.keymap.set("n", "¬", "g$")

vim.g.mapleader = ","

vim.keymap.set("i", "jk", "<Esc>")
vim.keymap.set("i", "kj", "<Esc>")

vim.keymap.set("n", "<S-h>", "^")
vim.keymap.set("n", "<S-l>", "$")

vim.keymap.set("v", "<S-h>", "^")
vim.keymap.set("v", "<S-l>", "$")

vim.keymap.set("n", "<leader>ch", ":noh<CR>")

vim.keymap.set("n", "<D-s>", ":w<CR>")
vim.keymap.set("i", "<D-s>", "<Esc>:w<CR>a")

-- Navigate vim panes better
vim.keymap.set("n", "<C-h>", ":wincmd h<CR>", { silent = true })
vim.keymap.set("n", "<C-j>", ":wincmd j<CR>", { silent = true })
vim.keymap.set("n", "<C-k>", ":wincmd k<CR>", { silent = true })
vim.keymap.set("n", "<C-l>", ":wincmd l<CR>", { silent = true })

-- remember folds
vim.api.nvim_create_autocmd({ "BufWinLeave" }, {
	pattern = { "*.*" },
	desc = "save view (folds), when closing file",
	command = "mkview",
})
vim.api.nvim_create_autocmd({ "BufWinEnter" }, {
	pattern = { "*.*" },
	desc = "load view (folds), when opening file",
	command = "silent! loadview",
})

-- vim commentary
vim.cmd([[nmap <D-/> <Plug>CommentaryLine]])
vim.cmd([[imap <D-/> <esc><Plug>CommentaryLine'^a]])
