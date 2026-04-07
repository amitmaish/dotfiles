local which = require("config_utils").which

vim.pack.add({ {
	src = "https://github.com/chomosuke/typst-preview.nvim",
	version = vim.version.range("1.*"),
} })

require("typst-preview").setup({
	dependencies_bin = {
		["tinymist"] = which("tinymist"),
		["websocat"] = which("websocat"),
	},
})
