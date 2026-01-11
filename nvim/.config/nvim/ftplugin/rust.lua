local bufnr = vim.api.nvim_get_current_buf()

WK.add({
	silent = true,
	buffer = bufnr,
	{
		"<leader>ca",
		function()
			vim.cmd.RustLsp("codeAction")
		end,
		desc = "code action",
	},
	{
		"K",
		function()
			vim.cmd.RustLsp({ "hover", "actions" })
		end,
		hidden = true,
	},
})
