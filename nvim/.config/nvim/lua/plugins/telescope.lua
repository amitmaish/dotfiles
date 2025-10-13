return {
	"nvim-telescope/telescope.nvim",
	dependencies = { "nvim-lua/plenary.nvim" },
	keys = {
		{
			"<leader> ",
			function()
				vim.cmd.Telescope("find_files")
			end,
			desc = "pick files",
		},
		{
			"<leader>pf",
			function()
				vim.cmd.Telescope("git_files")
			end,
			desc = "pick in git repo",
		},
	},
}
