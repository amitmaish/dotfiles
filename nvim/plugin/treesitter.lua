vim.api.nvim_create_autocmd("PackChanged", {
	callback = function(ev)
		local name, kind = ev.data.spec.name, ev.data.kind
		if name == "nvim-treesitter" and kind == "update" then
			if not ev.data.active then
				vim.cmd.packadd("nvim-treesitter")
			end
			vim.cmd("TSUpdate")
		end
	end,
})

vim.pack.add({ {
	src = "https://nvim-treesitter/nvim-treesitter",
	branch = "main",
} })

require("nvim-treesitter").setup({
	modules = {},
	ensure_installed = {},
	auto_install = true,
	sync_install = false,
	install_dir = vim.fn.stdpath("data") .. "/site",
	highlight = {
		enable = true,
		additional_vim_regex_highlighting = { "markdown" },
	},
	ignore_install = {},
	incremental_selection = {
		enable = false,
	},
	markdown = {
		enable = true,
	},
})
