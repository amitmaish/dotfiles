return {
	"stevearc/oil.nvim",
	---@module 'oil'
	---@type oil.SetupOpts
	opts = {},
	dependencies = { { "echasnovski/mini.icons", opts = {} } },
	lazy = false,
	keys = {
		{
			"<leader>o",
			function()
				vim.cmd("Oil")
			end,
			desc = "oil",
		},
	},
}
