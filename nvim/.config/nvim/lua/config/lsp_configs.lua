vim.lsp.enable({
	"asm_lsp",
	"ast_grep",
	"arduino_language_server",
	"bashls",
	"biome",
	"clangd",
	"cssls",
	"gopls",
	"hls",
	"html",
	"jsonls",
	"lua_ls",
	"marksman",
	"neocmake",
	"nil_ls",
	"qmlls",
	"ron-lsp",
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
vim.lsp.config("ron-lsp", {
	default_config = {
		cmd = { vim.fn.expand("ron-lsp") },
		filetypes = { "ron" },
		root_dir = function(fname)
			local util = require("lspconfig.util")
			return util.root_pattern("Cargo.toml", ".git")(fname) or vim.loop.cwd()
		end,
		settings = {},
	},
})
vim.lsp.config("tinymist", {
	on_attach = function(client, bufnr)
		vim.keymap.set("n", "<leader>tP", function()
			client:exec_cmd({

				title = "pin",

				command = "tinymist.pinMain",

				arguments = { vim.api.nvim_buf_get_name(0) },
			}, { bufnr = bufnr })
		end, { desc = "tinymist pin", noremap = true })

		vim.keymap.set("n", "<leader>tu", function()
			client:exec_cmd({

				title = "unpin",

				command = "tinymist.pinMain",

				arguments = { vim.v.null },
			}, { bufnr = bufnr })
		end, { desc = "tinymist unpin", noremap = true })
	end,
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
