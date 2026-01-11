Nvim_runtime = true

Snacks.toggle({
	name = "nvim runtime",
	get = function()
		return Nvim_runtime
	end,
	set = function(state)
		Nvim_runtime = not state

		local library = {}
		if state then
			library = vim.api.nvim_get_runtime_file("", true)
		end

		vim.lsp.config("lua_ls", {
			settings = {
				Lua = {
					workspace = {
						library = library,
					},
				},
			},
		})

		vim.cmd.LspRestart()
	end,
}):map("<leader>cn")
