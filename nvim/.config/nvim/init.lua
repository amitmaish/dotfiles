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

vim.keymap.set("n", "<leader>lf", require("conform").format)
vim.api.nvim_create_autocmd("BufWritePre", {
	pattern = "*",
	callback = function()
		require("conform").format()
	end,
})

vim.keymap.set("n", "<leader> ", ":Pick files<CR>", { silent = true })
vim.keymap.set("n", "<leader>pf", ":Pick files tool='git'<CR>", { silent = true })
vim.keymap.set("n", "<leader>so", ":so<CR>")
vim.keymap.set("n", "<leader>o", ":Oil<CR>", { silent = true })

vim.cmd.colorscheme("catppuccin")
vim.cmd("hi statusline guibg=NONE")

local appname
if vim.env.NVIM_APPNAME ~= nil then
	appname = vim.env.NVIM_APPNAME
else
	appname = "nvim"
end

require("luasnip.loaders.from_lua").load({ paths = "~/.config/" .. appname .. "/snippets" })

local ls = require("luasnip")
vim.keymap.set({ "i" }, "<C-e>", function()
	ls.expand()
end, { silent = true })
vim.keymap.set({ "i", "s" }, "<C-n>", function()
	ls.jump(1)
end, { silent = true })
vim.keymap.set({ "i", "s" }, "<C-p>", function()
	ls.jump(-1)
end, { silent = true })

local list_snips = function()
	local ft_list = require("luasnip").available()[vim.o.filetype]
	local ft_snips = {}
	for _, item in pairs(ft_list) do
		ft_snips[item.trigger] = item.name
	end
	print(vim.inspect(ft_snips))
end
vim.api.nvim_create_user_command("SnipList", list_snips, {})

vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)

require("snacks")

vim.keymap.set("n", "<leader>gg", function()
	Snacks.lazygit()
end)

require("flash").setup()

vim.keymap.set({ "n", "x", "o" }, "s", function()
	require("flash").jump()
end)
vim.keymap.set({ "n", "x", "o" }, "S", function()
	require("flash").treesitter()
end)
vim.keymap.set({ "o" }, "r", function()
	require("flash").remote()
end)
vim.keymap.set({ "x", "o" }, "R", function()
	require("flash").treesitter_search()
end)
vim.keymap.set({ "c" }, "<c-s>", function()
	require("flash").toggle()
end)
