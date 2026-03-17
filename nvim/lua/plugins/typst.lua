local which = require("config_utils").which

return {
	"chomosuke/typst-preview.nvim",
	ft = "typst",
	version = "1.*",
	opts = {
		dependencies_bin = {
			["tinymist"] = which("tinymist"),
			["websocat"] = which("websocat"),
		},
	},
}
