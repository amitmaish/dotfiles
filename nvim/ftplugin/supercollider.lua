require("luasnip").add_snippets("supercollider", require("scnvim/utils").get_snippets())

WK.add({
	{ "<leader>pS", "<cmd>Telescope scdoc<cr>", desc = "pick supercollider docs" },
})
