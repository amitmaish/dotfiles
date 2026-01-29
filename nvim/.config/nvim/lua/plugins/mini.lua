return {
	"nvim-mini/mini.nvim",
	version = "*",
	config = function()
		require("mini.ai").setup({
			n_lines = 100,
		})
		require("mini.align").setup()
		require("mini.bracketed").setup()
		require("mini.comment").setup()
		require("mini.icons").setup()
		require("mini.pairs").setup({
			mappings = {
				["'"] = false,
			},
		})
		require("mini.sessions").setup()
		require("mini.statusline").setup({
			content = {
				active = function()
					local mode, mode_hl = MiniStatusline.section_mode({ trunc_width = 120 })
					local git = MiniStatusline.section_git({ trunc_width = 40 })
					local diff = MiniStatusline.section_diff({ trunc_width = 75 })
					local diagnostics = MiniStatusline.section_diagnostics({ trunc_width = 75 })
					local lsp = MiniStatusline.section_lsp({ trunc_width = 75 })
					local filename = MiniStatusline.section_filename({ trunc_width = 10 })
					local fileinfo = MiniStatusline.section_fileinfo({ trunc_width = 120 })
					local location = MiniStatusline.section_location({ trunc_width = 75 })
					local search = MiniStatusline.section_searchcount({ trunc_width = 75 })

					return MiniStatusline.combine_groups({
						{ hl = mode_hl, strings = { mode:lower() } },
						{ hl = "MiniStatuslineDevinfo", strings = { git, diff, diagnostics, lsp } },
						"%<", -- Mark general truncate point
						{
							hl = "MiniStatuslineFilename",
							strings = { vim.bo.filetype ~= "" and filename:gsub("%F", "%f") },
						},
						"%=", -- End left alignment
						{ hl = "MiniStatuslineFileinfo", strings = { fileinfo:gsub("%[.*%]", "") } },
						{ hl = mode_hl, strings = { search, location } },
					})
				end,
			},
		})
		require("mini.surround").setup({
			mappings = {
				add = "gsa", -- Add surrounding in Normal and Visual modes
				delete = "gsd", -- Delete surrounding
				find = "gsf", -- Find surrounding (to the right)
				find_left = "gsF", -- Find surrounding (to the left)
				highlight = "gsh", -- Highlight surrounding
				replace = "gsr", -- Replace surrounding
				update_n_lines = "gsn", -- Update `n_lines`

				suffix_last = "l", -- Suffix to search with "prev" method
				suffix_next = "n", -- Suffix to search with "next" method
			},
		})
	end,
}
