vim.cmd.LspStop()

vim.bo.expandtab = true

WK.add({
	{ "<leader>t", group = "tidal" },
	{ "<leader>tl", "<cmd>TidalLaunch<cr>", desc = "launch tidal" },
	{ "<leader>tn", "<cmd>TidalNotification<cr>", desc = "open tidal notifications" },
})
