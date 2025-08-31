vim.o.number = true
vim.o.relativenumber = true
vim.o.signcolumn = "yes"
vim.o.tabstop = 2
vim.o.swapfile = false
vim.o.winborder = "rounded"

vim.g.mapleader = " "

vim.keymap.set("i", "jk", "<esc>")
vim.keymap.set({ "n", "v" }, "H", "^")
vim.keymap.set({ "n", "v" }, "L", "$")
vim.keymap.set("n", "<leader>qq", ":qa<cr>")

vim.keymap.set("n", "<c-h>", "<c-w>h")
vim.keymap.set("n", "<c-j>", "<c-w>j")
vim.keymap.set("n", "<c-k>", "<c-w>k")
vim.keymap.set("n", "<c-l>", "<c-w>l")

vim.pack.add({
	{ src = "https://github.com/catppuccin/vim" },
	{ src = "https://github.com/stevearc/oil.nvim" },
	{ src = "https://github.com/nvim-treesitter/nvim-treesitter" },
	{ src = "https://github.com/windwp/nvim-autopairs" },
	{ src = "https://github.com/echasnovski/mini.pick" },
	{ src = "https://github.com/neovim/nvim-lspconfig" },
	{ src = "https://github.com/mason-org/mason.nvim" },
	{ src = "https://github.com/L3MON4D3/LuaSnip" },
	{ src = "https://github.com/saghen/blink.cmp" },
	{ src = "https://github.com/stevearc/conform.nvim" },
	{ src = "https://github.com/echasnovski/mini.surround" },
	{ src = "https://github.com/mrcjkb/rustaceanvim" },
	{ src = "https://github.com/mbbill/undotree" },
	{ src = "https://github.com/folke/snacks.nvim" },
	{ src = "https://github.com/lewis6991/gitsigns.nvim" },
	{ src = "https://github.com/folke/flash.nvim" },
})

require("mason").setup({
	ui = {
		border = "rounded",
	},
})

require("mini.pick").setup()
require("mini.surround").setup({
	mappings = {
		add = "gsa", -- Add surrounding in Normal and Visual modes
		delete = "gsd", -- Delete surrounding
		find = "gsf", -- Find surrounding (to the right)
		find_left = "gsF", -- Find surrounding (to the left)
		highlight = "gsh", -- Highlight surrounding
		replace = "gsr", -- Replace surrounding
		update_n_lines = "gsn", -- Update `n_lines`

		suffix_last = "l", -- Suffix to search with "prev" method
		suffix_next = "n", -- Suffix to search with "next" method
	},
})
require("oil").setup()
require("nvim-autopairs").setup()

vim.lsp.enable({ "clangd", "biome", "lua_ls", "ruff", "vtsls" })
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

require("conform").setup({
	formatters_by_ft = {
		lua = { "stylua" },
		javascript = { "prettier", stop_after_first = true },
		json = { "prettier" },
		python = { "ruff" },
		rust = { "rustfmt" },
		typescript = { "prettier" },
	},
})
vim.keymap.set("n", "<leader>lf", require("conform").format)
vim.api.nvim_create_autocmd("BufWritePre", {
	pattern = "*",
	callback = function()
		require("conform").format()
	end,
})

vim.keymap.set("n", "<leader> ", ":Pick files<CR>", { silent = true })
vim.keymap.set("n", "<leader>pg", ":Pick files tool='git'<CR>", { silent = true })
vim.keymap.set("n", "<leader>so", ":so<CR>")
vim.keymap.set("n", "<leader>o", ":Oil<CR>", { silent = true })

vim.cmd("colorscheme catppuccin_mocha")
vim.cmd("hi statusline guibg=NONE")

require("luasnip").setup({ enable_autosnippets = true })

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
vim.keymap.set({ "i", "s" }, "<C-J>", function()
	ls.jump(1)
end, { silent = true })
vim.keymap.set({ "i", "s" }, "<C-K>", function()
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

require("blink.cmp").setup({
	keymap = { preset = "default" },

	appearance = { nerd_font_variant = "mono" },
	completion = { documentation = { auto_show = false } },
	sources = {
		default = { "lsp", "path", "buffer" },
	},
	fuzzy = {
		implementation = "prefer_rust",
		prebuilt_binaries = {
			download = true,
		},
	},
})

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
