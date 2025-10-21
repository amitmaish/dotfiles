local tidal_bootfile = vim.env.TIDAL_BOOTFILE
if tidal_bootfile == nil then
	tidal_bootfile = vim.api.nvim_get_runtime_file("bootfiles/BootTidal.hs", false)[1]
end

local colors = require("catppuccin.palettes").get_palette("mocha")

return {
	{
		"thgrund/tidal.nvim",
		branch = "develop",
		---@type TidalConfig
		opts = {
			boot = {
				tidal = {
					cmd = "ghci",
					args = {
						"-v0",
					},
					file = tidal_bootfile,
					enabled = true,

					highlight = {
						autostart = true,
						styles = {
							osc = {
								ip = "127.0.0.1",
								port = 3335,
							},
							custom = {
								["drums"] = { bg = colors.pink, foreground = colors.crust },
								["2"] = { bg = colors.green, foreground = colors.crust },
							},
							global = {
								baseName = "CodeHighlight",
								style = { bg = colors.blue, foreground = colors.crust },
							},
						},
						events = {
							osc = {
								ip = "127.0.0.1",
								port = 6013,
							},
						},
						fps = 45,
					},
				},
				split = "v",
			},
			--- @type table | nil
			mappings = {
				send_line = { mode = { "i", "n" }, key = "<S-CR>" },
				send_visual = { mode = { "x" }, key = "<S-CR>" },
				send_block = { mode = { "i", "n", "x" }, key = "<M-CR>" },
				send_node = { mode = "n", key = "<leader><CR>" },
				send_silence = { mode = "n", key = "<leader>d" },
				send_hush = { mode = "n", key = "<leader><Esc>" },
			},
			selection_highlight = {
				--- @type vim.api.keyset.highlight
				highlight = { link = "IncSearch" },
				timeout = 150,
			},
		},
		dependencies = {
			{
				"nvim-treesitter/nvim-treesitter",
				opts = { ensure_installed = { "haskell", "supercollider" } },
			},
		},
	},
	{
		"thgrund/tidal-makros.nvim",
		config = function()
			require("makros").setup()
		end,
	},
}
