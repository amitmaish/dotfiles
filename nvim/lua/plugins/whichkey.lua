return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	---@type wk.Opts
	opts = {
		preset = "helix",
		delay = function(ctx)
			return ctx.plugin and 0 or 200
		end,
		spec = {
			{ "<leader>", group = "leader" },
			{ "<leader>c", group = "code" },
			{ "<leader>g", group = "go" },
			{ "<leader>p", group = "pick" },
			{ "<leader>q", group = "quit" },
			{ "<leader>u", group = "ui" },
			{ "gr", group = "lsp" },
			{ "gs", group = "surround" },
			{ "q", group = "quit" },
			{ "z", group = "fold" },
		},
	},
	keys = {
		{
			"<leader>?",
			function()
				require("which-key").show({ global = false })
			end,
			desc = "Buffer Local Keymaps (which-key)",
		},
	},
}
