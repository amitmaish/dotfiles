return {
	---@type LazyPluginSpec
	{
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
					["StatusLine"] = { bg = colors.none },
					["StatusLineNC"] = { bg = colors.none },

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
			init = function()
				vim.cmd.colorscheme("catppuccin")
			end,
		},
	},
	---@type LazyPluginSpec
	{
		name = "sakura-crush",
		dev = true,
		dir = "~/dev/sakura-crush",
		opts = {},
	},
	{ "folke/tokyonight.nvim" },
	{ "sts10/vim-pink-moon" },
	{ "nikolvs/vim-sunbather" },
	{ "cocopon/iceberg.vim" },
	{ "cocopon/colorswatch.vim" },
}
