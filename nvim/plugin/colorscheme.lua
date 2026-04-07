vim.pack.add({
	"https://github.com/rktjmp/lush.nvim",
	{
		src = "https://github.com/catppuccin/nvim",
		name = "catppuccin",
	},
	"https://github.com/folke/tokyonight.nvim",
	"https://github.com/sts10/vim-pink-moon",
	"https://github.com/nikolvs/vim-sunbather",
	"https://github.com/cocopon/iceberg.vim",
	"https://github.com/cocopon/colorswatch.vim",
	"https://github.com/rebelot/kanagawa.nvim",
	"https://github.com/morhetz/gruvbox",
	"https://github.com/vague-theme/vague.nvim",
	"https://github.com/rose-pine/neovim",
	"https://github.com/EdenEast/nightfox.nvim",
	"https://github.com/nyoom-engineering/oxocarbon.nvim",
	"https://github.com/dracula/vim",
	"https://github.com/scottmckendry/cyberdream.nvim",
	"https://github.com/HoNamDuong/hybrid.nvim",
	"https://github.com/thesimonho/kanagawa-paper.nvim",
	"https://github.com/anAcc22/sakura.nvim",
	"https://github.com/oskarnurm/koda.nvim",
	"https://github.com/pineapplegiant/spaceduck",
	"https://github.com/thedenisnikulin/vim-cyberpunk",
	"https://github.com/2giosangmitom/nightfall.nvim",
	"https://github.com/Pearljak/terracotta.nvim",
	"https://github.com/attron/bebop.nvim",
	"https://github.com/dasch/vim-mocha",
})

require("catppuccin").setup({
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
})

vim.cmd.colorscheme("catppuccin")
