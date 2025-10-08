return {
	"davidgranstrom/scnvim",
	lazy = false,
	config = function()
		local scnvim = require("scnvim")
		local sc_bootfile

		if vim.env.SC_BOOTFILE then
			sc_bootfile = vim.env.SC_BOOTFILE
		else
			sc_bootfile = "/Users/amit/Library/Application Support/SuperCollider/startup.scd"
		end

		local map = scnvim.map
		local map_expr = scnvim.map_expr
		scnvim.setup({
			sclang = {
				cmd = "/Applications/SuperCollider.app/Contents/MacOS/sclang",
				args = { sc_bootfile },
			},
			keymaps = {
				["<D-e>"] = map("editor.send_line", { "i", "n" }),
				["<C-e>"] = {
					map("editor.send_block", { "i", "n" }),
					map("editor.send_selection", "x"),
				},
				["<CR>"] = map("postwin.toggle"),
				["<M-CR>"] = map("postwin.toggle", "i"),
				["<M-L>"] = map("postwin.clear", { "n", "i" }),
				["<C-k>"] = map("signature.show", { "n", "i" }),
				["<F12>"] = map("sclang.hard_stop", { "n", "x", "i" }),
				["<leader>st"] = map("sclang.start"),
				["<leader>sk"] = map("sclang.recompile"),
				["<F1>"] = map_expr("s.boot"),
				["<F2>"] = map_expr("s.meter"),
			},
			editor = {
				highlight = {
					color = "IncSearch",
				},
			},
			postwin = {
				float = {
					enabled = true,
				},
			},
		})

		if vim.env.SC_NOAUTOSTART == nil then
			vim.api.nvim_create_autocmd("User", {
				pattern = "TidalLaunch",
				callback = function()
					scnvim.start()
				end,
			})
		end
	end,
}
