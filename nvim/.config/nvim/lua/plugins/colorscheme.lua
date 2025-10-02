return {
	"catppuccin/nvim",
	name = "catppuccin",
	priority = 1000,
	opts = {
		auto_integrations = true,
		custom_highlights = function(colors)
			return {
				["@property"] = { fg = colors.lavender },
				["@markup.italic"] = { fg = colors.green },
				["@markup.strong"] = { fg = colors.mauve },
			}
		end,
	},
}
