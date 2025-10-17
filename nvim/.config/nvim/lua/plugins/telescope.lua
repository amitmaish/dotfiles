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
			require("telescope.builtin").find_files,
			desc = "telescope files",
		},
		{
			"<leader>pf",
			require("telescope.builtin").git_files,
			desc = "telescope git files",
		},
		{
			"<leader>ph",
			require("telescope.builtin").help_tags,
			desc = "telescope help tags",
		},
		{
			"<leader>pg",
			require("telescope.builtin").live_grep,
			desc = "telescope grep",
		},
		{
			"<leader>pb",
			require("telescope.builtin").builtin,
			desc = "telescope builtins",
		},
	},
}
