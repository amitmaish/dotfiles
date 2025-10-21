return {
	"catppuccin/nvim",
	name = "catppuccin",
	priority = 1000,
	---@type CatppuccinOptions
	opts = {
		auto_integrations = true,
		custom_highlights = function(colors)
			return {
				["@property"] = { fg = colors.lavender },
				["@markup.italic"] = { fg = colors.green },
				["@markup.strong"] = { fg = colors.mauve },
				["statusline"] = { bg = colors.none },

				-- mini
				["MiniStatuslineModeNormal"] = { fg = colors.blue, bg = colors.none },
				["MiniStatuslineModeInsert"] = { fg = colors.green, bg = colors.none },
				["MiniStatuslineModeVisual"] = { fg = colors.mauve, bg = colors.none },
				["MiniStatuslineModeCommand"] = { fg = colors.peach, bg = colors.none },
				["MiniStatuslineModeReplace"] = { fg = colors.red, bg = colors.none },
				["MiniStatuslineModeOther"] = { fg = colors.teal, bg = colors.none },
				["MiniStatuslineFilename"] = { link = "Comment" },
				["MiniStatuslineFileinfo"] = { link = "Comment" },
				["MiniStatuslineDevinfo"] = { link = "Comment" },
			}
		end,
	},
	config = function(opts)
		require("catppuccin").setup(opts)
		vim.cmd.colorscheme("catppuccin")
	end,
}
