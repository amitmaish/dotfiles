return {
	"nvim-telescope/telescope.nvim",
	dependencies = { "nvim-lua/plenary.nvim", "davidgranstrom/telescope-scdoc.nvim" },
	config = function(opts)
		local telescope = require("telescope")
		telescope.setup(opts)
		telescope.load_extension("scdoc")
	end,
	keys = {
		{
			"<leader> ",
			function()
				vim.cmd.Telescope("find_files")
			end,
			desc = "telescope files",
		},
		{
			"<leader>pf",
			function()
				vim.cmd.Telescope("git_files")
			end,
			desc = "telescope git files",
		},
		{
			"<leader>ph",
			function()
				vim.cmd.Telescope("help_tags")
			end,
			desc = "telescope help tags",
		},
		{
			"<leader>pg",
			function()
				vim.cmd.Telescope("live_grep")
			end,
			desc = "telescope grep",
		},
	},
}
