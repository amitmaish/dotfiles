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
							school_notes = "~/Documents/calarts/spring25/",
						},
						default_workspace = "school_notes",
					},
				},
			},
		})
	end,
}
