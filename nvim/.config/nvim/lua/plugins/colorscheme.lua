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
					["LspInlayHint"] = { link = "SignColumn" },

					-- typst
					["@markup.heading.1.typst"] = { link = "rainbow1" },
					["@markup.heading.2.typst"] = { link = "rainbow2" },
					["@markup.heading.3.typst"] = { link = "rainbow3" },
					["@markup.heading.4.typst"] = { link = "rainbow4" },
					["@markup.heading.5.typst"] = { link = "rainbow5" },
					["@markup.heading.6.typst"] = { link = "rainbow6" },

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
	{ "folke/tokyonight.nvim" },
	{ "sts10/vim-pink-moon" },
	{ "nikolvs/vim-sunbather" },
	{ "cocopon/iceberg.vim" },
	{ "cocopon/colorswatch.vim" },
	{ "rebelot/kanagawa.nvim" },
	{ "morhetz/gruvbox" },
	{ "vague-theme/vague.nvim" },
	{ "rose-pine/neovim" },
	{ "EdenEast/nightfox.nvim" },
	{ "nyoom-engineering/oxocarbon.nvim" },
	{ "dracula/vim" },
	{ "scottmckendry/cyberdream.nvim" },
	{ "HoNamDuong/hybrid.nvim" },
	{ "thesimonho/kanagawa-paper.nvim" },
	{ "anAcc22/sakura.nvim", dependencies = "rktjmp/lush.nvim" },
	{ "oskarnurm/koda.nvim" },
	{ "pineapplegiant/spaceduck" },
	{ "thedenisnikulin/vim-cyberpunk" },
	{ "2giosangmitom/nightfall.nvim" },
	{ "Pearljak/terracotta.nvim" },
	{ "attron/bebop.nvim" },
	{ "dasch/vim-mocha" },
}
