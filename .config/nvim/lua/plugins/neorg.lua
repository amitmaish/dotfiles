return {
	"nvim-neorg/neorg",
	lazy = false,
	version = "*",
	config = function()
		require("neorg").setup({
			load = {
				["core.defaults"] = {},
				["core.concealer"] = {},
				["core.dirman"] = {
					config = {
						workspaces = {
							notes = "~/notes/",
							school_notes = "~/Documents/calarts/spring25/",
						},
						default_workspace = "notes",
					},
				},
			},
		})
		vim.keymap.set("n", "<localleader>ni", ":Neorg index<cr>")
		vim.keymap.set("n", "<localleader>nr", ":Neorg return<cr>")
		vim.keymap.set("n", "<localleader>nm", ":Neorg inject-metadata<cr>")
	end,
}
