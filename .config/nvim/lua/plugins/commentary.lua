return {
	{
		"tpope/vim-commentary",
		config = function()
			vim.keymap.set("n", "÷", "gcc", { remap = true })
			vim.keymap.set("i", "÷", "<esc>gcc`^i", { remap = true })
			vim.keymap.set("v", "÷", "gc", { remap = true })
		end,
	},
}
