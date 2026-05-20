if require("scnvim/utils").get_snippets() then
	require("luasnip").add_snippets("supercollider", require("scnvim/utils").get_snippets())
end

WK.add({
	{ "<leader>pS", "<cmd>Telescope scdoc<cr>", desc = "pick supercollider docs" },
})
