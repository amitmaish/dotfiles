return {
	"catppuccin/nvim",
	name = "catppuccin",
	priority = 1000,
	opts = {
		integrations = {
			gitsigns = true,
			treesitter = true,
		},
		custom_highlights = function(colors)
			return {
				["@property"] = { fg = colors.lavender },
			}
		end,
	},
}
