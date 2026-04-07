vim.pack.add({
	"https://github.com/folke/which-key.nvim",
	"https://github.com/folke/snacks.nvim",
})

WK = require("which-key")
WK.setup({
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
		{
			"<leader>?",
			function()
				require("which-key").show({ global = false })
			end,
			desc = "Buffer Local Keymaps (which-key)",
		},
	},
})

---@Snacks
Snacks = require("snacks")
