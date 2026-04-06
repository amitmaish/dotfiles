vim.bo.expandtab = true
vim.bo.tabstop = 4

vim.treesitter.language.register("haskell", { "tidal" })
vim.treesitter.start()

WK.add({
	{ "<leader>t", group = "tidal" },
	{ "<leader>tl", "<cmd>TidalLaunch<cr>", desc = "launch tidal" },
	{ "<leader>tn", "<cmd>TidalNotification<cr>", desc = "open tidal notifications" },
})
