return {
	"nvim-mini/mini.pick",
	version = "*",
	opts = {},
	keys = {
		{
			"<leader> ",
			function()
				vim.cmd.Pick("files")
			end,
			desc = "pick files",
		},
		{
			"<leader> ",
			function()
				vim.cmd.Pick("files tool='git'")
			end,
			desc = "pick in git repo",
		},
	},
}
