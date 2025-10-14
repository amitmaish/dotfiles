return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	opts = {
		preset = "helix",
		---@type number | fun(ctx: { keys: string, mode: string, plugin?: string }):number
		delay = function(ctx)
			return ctx.plugin and 0 or 200
		end,
		spec = {
			{ "<leader>", group = "leader" },
			{ "<leader>c", group = "code" },
			{ "<leader>g", group = "go" },
			{ "<leader>p", group = "pick" },
			{ "<leader>t", group = "tidal" },
			{ "<leader>q", group = "quit" },
			{ "gr", group = "lsp" },
			{ "gs", group = "surround" },
			{ "z", group = "fold" },
			{ "q", group = "quit" },
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
