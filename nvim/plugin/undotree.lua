vim.cmd.packadd("nvim.undotree")

require("which-key").add({
	{ "<leader>U", vim.cmd.Undotree, desc = "Undotree Toggle" },
})
