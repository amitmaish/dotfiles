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

vim.lsp.enable({
	"asm_lsp",
	"ast_grep",
	"arduino_language_server",
	"biome",
	"clangd",
	"gopls",
	"hls",
	"html",
	"jsonls",
	"lua_ls",
	"marksman",
	"nil_ls",
	"ruff",
	"taplo",
	"texlab",
	"tinymist",
	"vtsls",
	"yamlls",
	"zls",
})
vim.lsp.config("arduino_language_server", {
	cmd = {
		"arduino-language-server",
		"-clangd",
		vim.fn.stdpath("data") .. "/mason/bin/clangd",
		"-cli",
		"/usr/local/bin/arduino-cli",
		"-cli-config",
		vim.fn.expand("$HOME/") .. ".arduinoIDE/arduino-cli.yaml",
	},
})
vim.lsp.config("lua_ls", {
	settings = {
		Lua = {
			workspace = {
				library = vim.api.nvim_get_runtime_file("", true),
			},
		},
	},
})
vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action)
vim.keymap.set("n", "gd", vim.lsp.buf.definition)
vim.keymap.set("n", "<leader>cr", vim.lsp.buf.rename)

vim.keymap.set("n", "<leader> ", ":Pick files<CR>", { silent = true })
vim.keymap.set("n", "<leader>pf", ":Pick files tool='git'<CR>", { silent = true })
vim.keymap.set("n", "<leader>so", ":so<CR>")

vim.cmd.colorscheme("catppuccin")
vim.cmd("hi statusline guibg=NONE")

local snacks = require("snacks")

vim.keymap.set("n", "<leader>gg", function()
	snacks.lazygit()
end)

if vim.g.neovide then
	vim.g.neovide_cursor_animation_length = 0
end
