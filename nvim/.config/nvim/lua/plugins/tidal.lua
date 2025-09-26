local tidal_bootfile = vim.env.TIDAL_BOOTFILE
if tidal_bootfile == nil then
	tidal_bootfile = vim.api.nvim_get_runtime_file("bootfiles/BootTidal.hs", false)[1]
end

local colors = require("catppuccin.palettes").get_palette("mocha")

return {
	{
		"thgrund/tidal.nvim",
		branch = "develop",
		opts = {
			--- Configure TidalLaunch command
			boot = {
				tidal = {
					--- Command to launch ghci with tidal installation
					cmd = "ghci",
					args = {
						"-v0",
					},
					--- Tidal boot file path
					file = tidal_bootfile,
					enabled = true,

					highlight = {
						autostart = true,
						styles = {
							osc = {
								ip = "127.0.0.1",
								port = 3335,
							},
							-- [Tidal ID] -> hl style
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
				sclang = {
					--- Command to launch SuperCollider
					cmd = "sclang",
					args = {},
					--- SuperCollider boot file
					file = vim.api.nvim_get_runtime_file("bootfiles/BootSuperDirt.scd", false)[1],
					enabled = false,
				},
				split = "v",
			},
			--- Default keymaps
			--- Set to false to disable all default mappings
			--- @type table | nil
			mappings = {
				send_line = { mode = { "i", "n" }, key = "<S-CR>" },
				send_visual = { mode = { "x" }, key = "<S-CR>" },
				send_block = { mode = { "i", "n", "x" }, key = "<M-CR>" },
				send_node = { mode = "n", key = "<leader><CR>" },
				send_silence = { mode = "n", key = "<leader>d" },
				send_hush = { mode = "n", key = "<leader><Esc>" },
			},
			---- Configure highlight applied to selections sent to tidal interpreter
			selection_highlight = {
				--- Highlight definition table
				--- see ':h nvim_set_hl' for details
				--- @type vim.api.keyset.highlight
				highlight = { link = "IncSearch" },
				--- Duration to apply the highlight for
				timeout = 150,
			},
		},
		-- Recommended: Install TreeSitter parsers for Haskell and SuperCollider
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
			opts = { ensure_installed = { "haskell", "supercollider" } },
		},
	},
	{
		"thgrund/tidal-makros.nvim",
		config = function()
			require("makros").setup()
		end,
	},
}
