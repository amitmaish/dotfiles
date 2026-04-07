vim.cmd.packadd("nvim.undotree")

require("which-key").add({
	{ "<leader>U", vim.cmd.UndotreeToggle, desc = "UndotreeToggle" },
})
