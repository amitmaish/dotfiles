return {
	"davidgranstrom/scnvim",
	lazy = false,
	pin = true,
	config = function()
		local scnvim = require("scnvim")
		local which = require("config_utils").which

		local map = scnvim.map
		local map_expr = scnvim.map_expr
		scnvim.setup({
			sclang = {
				cmd = which("sclang"),
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
			snippet = {
				engine = {
					name = "luasnip",
					options = {
						descriptions = true,
					},
				},
			},
			postwin = {
				float = {
					enabled = true,
					config = { border = "rounded" },
				},
			},
			documentation = {
				cmd = which("pandoc"),
				horizontal = true,
				direction = "top",
				keymaps = true,
			},
		})
	end,
}
