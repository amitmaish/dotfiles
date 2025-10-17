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

return {
	{
		"https://github.com/neovim/nvim-lspconfig",
	},
	{
		"mason-org/mason.nvim",
		opts = {
			ui = { border = "rounded" },
		},
	},
	{
		"https://github.com/mfussenegger/nvim-dap",
	},
	{
		"https://github.com/rcarriga/nvim-dap-ui",
		dependencies = { "https://github.com/mfussenegger/nvim-dap" },
	},
	{
		"mrcjkb/rustaceanvim",
		version = "^6", -- Recommended
		lazy = false, -- This plugin is already lazy
	},
	{
		"saecki/crates.nvim",
		tag = "stable",
		config = function()
			require("crates").setup({
				lsp = {
					enabled = true,
					actions = true,
					completion = true,
					hover = true,
				},
			})
		end,
	},
}
