vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.tabstop = 4

vim.g.mapleader = " "

vim.keymap.set("i", "jk", "<esc>")
vim.keymap.set({ "n", "v" }, "H", "^")
vim.keymap.set({ "n", "v" }, "L", "$")
vim.keymap.set("n", "<leader>q", ":quit<cr>")

vim.pack.add({
	{src = "https://github.com/catppuccin/vim"},
	{src = "https://github.com/stevearc/oil.nvim"},
	{src = "https://github.com/echasnovski/mini.pick"},
	{src = "https://github.com/neovim/nvim-lspconfig"},
	{src = "https://github.com/mason-org/mason.nvim"},
})

vim.lsp.enable({"lua_ls"})
vim.keymap.set("n", "<leader>lf", vim.lsp.buf.format)

vim.cmd("colorscheme catppuccin_mocha")
