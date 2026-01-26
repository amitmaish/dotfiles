return {
	"nvim-telescope/telescope.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"JoseConseco/telescope_sessions_picker.nvim",
		"davidgranstrom/telescope-scdoc.nvim",
	},
	opts = {
		extensions = {
			sessions_picker = {
				sessions_dir = vim.fn.stdpath("data") .. "/session/",
			},
		},
	},
	config = function(opts)
		local telescope = require("telescope")
		telescope.setup(opts)
		telescope.load_extension("sessions_picker")
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
		{
			"<leader>ps",
			function()
				vim.cmd.Telescope("sessions_picker")
			end,
			desc = "telescope sessions",
		},
		{
			"<leader>pc",
			require("telescope.builtin").colorscheme,
			desc = "telescope colorschemes",
		},
	},
}

-- return {
-- 	"nvim-telescope/telescope.nvim",
-- 	dependencies = {
-- 		"nvim-lua/plenary.nvim",
-- 	},
-- 	keys = {
-- 		{
-- 			"<leader> ",
-- 			require("telescope.builtin").find_files,
-- 			desc = "telescope files",
-- 		},
-- 		{
-- 			"<leader>pf",
-- 			require("telescope.builtin").git_files,
-- 			desc = "telescope git files",
-- 		},
-- 		{
-- 			"<leader>ph",
-- 			require("telescope.builtin").help_tags,
-- 			desc = "telescope help tags",
-- 		},
-- 		{
-- 			"<leader>pg",
-- 			require("telescope.builtin").live_grep,
-- 			desc = "telescope grep",
-- 		},
-- 		{
-- 			"<leader>pb",
-- 			require("telescope.builtin").builtin,
-- 			desc = "telescope builtins",
-- 		},
-- 		{
-- 			"<leader>ps",
-- 			function()
-- 				vim.cmd.Telescope("sessions_picker")
-- 			end,
-- 			desc = "telescope sessions",
-- 		},
-- 		{
-- 			"<leader>pc",
-- 			require("telescope.builtin").colorscheme,
-- 			desc = "telescope colorschemes",
-- 		},
-- 	},
-- }
