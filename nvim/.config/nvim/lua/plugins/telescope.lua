return {
	"nvim-telescope/telescope.nvim",
	dependencies = { "nvim-lua/plenary.nvim", "davidgranstrom/telescope-scdoc.nvim" },
	config = function(opts)
		Telescope = require("telescope")
		Telescope.setup(opts)
		Telescope.load_extension("scdoc")
	end,
	keys = {
		{
			"<leader> ",
			function()
				Telescope.builtin.find_files()
			end,
			desc = "telescope files",
		},
		{
			"<leader>pf",
			function()
				Telescope.builtin.git_files()
			end,
			desc = "telescope git files",
		},
		{
			"<leader>ph",
			function()
				Telescope.builtin.help_tags()
			end,
			desc = "telescope help tags",
		},
		{
			"<leader>pg",
			function()
				Telescope.builtin.live_grep()
			end,
			desc = "telescope grep",
		},
		{
			"<leader>pb",
			function()
				Telescope.builtin.builtin()
			end,
			desc = "telescope builtins",
		},
	},
}
