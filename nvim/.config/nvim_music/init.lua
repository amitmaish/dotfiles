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
})

require("mason").setup()
require("nvim-treesitter.configs").setup({
	auto_install = true,
})

require("mini.pick").setup()
require("oil").setup()
require("nvim-autopairs").setup()

vim.lsp.enable({ "ast_grep", "biome", "lua_ls", "prettier" })
vim.lsp.config("*", {
	root_markers = { ".git" },
})
vim.lsp.config("biome", {
	workspace_required = false,
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
vim.lsp.config("prettier", {
	filetypes = { "css", "html", "json", "jsx", "javascript", "typescript", "yaml" },
})

require("conform").setup({
	formatters_by_ft = {
		lua = { "stylua" },
		javascript = { "prettier", stop_after_first = true },
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
vim.keymap.set("n", "<leader>o", ":Oil<CR>", { silent = true })

vim.cmd("colorscheme catppuccin_mocha")
vim.cmd("hi statusline guibg=NONE")

require("luasnip").setup({ enable_autosnippets = true })
require("luasnip.loaders.from_lua").load({ paths = "~/.config/" .. vim.env.NVIM_APPNAME .. "/snippets" })

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
