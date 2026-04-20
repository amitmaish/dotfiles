WK.add({
	{ "<leader>t", group = "typst" },
	{ "<leader>tp", "<cmd>TypstPreviewToggle<cr>", desc = "toggle typst preview" },
})

require("mini.pairs").map_buf(0, "i", "_", { action = "closeopen", pair = "__", neigh_pattern = "`^[^\\]`" })
