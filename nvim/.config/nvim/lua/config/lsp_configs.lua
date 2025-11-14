vim.lsp.enable({
	"asm_lsp",
	"ast_grep",
	"arduino_language_server",
	"biome",
	"clangd",
	"css-lsp",
	"gopls",
	"hls",
	"html",
	"jsonls",
	"lua_ls",
	"marksman",
	"neocmake",
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
		vim.env.HOME .. ".arduinoIDE/arduino-cli.yaml",
	},
})
vim.lsp.config("lua_ls", {
	settings = {
		Lua = {
			hint = { enable = true },
			workspace = {
				library = vim.api.nvim_get_runtime_file("", true),
			},
		},
	},
})

Snacks.toggle
	.new({
		id = "inlay hints",
		name = "inlay hints",
		get = function()
			return vim.lsp.inlay_hint.is_enabled()
		end,
		set = function(state)
			vim.lsp.inlay_hint.enable(state)
		end,
	})
	:map("<leader>ui")
