if vim.g.neovide then
	vim.g.neovide_cursor_animation_length = 0

	local snacks = require("snacks")
	local monospace = true
	snacks.toggle
		.new({
			id = "monospace",
			name = "monospace",
			get = function()
				return monospace
			end,
			set = function(state)
				monospace = not state
				if monospace then
					vim.o.guifont = "JetBrainsMono Nerd Font"
				else
					vim.o.guifont = "Arimo Nerd Font"
				end
			end,
		})
		:map("<leader>um")

	vim.keymap.set({ "n", "v" }, "<C-+>", ":lua vim.g.neovide_scale_factor = vim.g.neovide_scale_factor + 0.1<CR>")
	vim.keymap.set({ "n", "v" }, "<C-->", ":lua vim.g.neovide_scale_factor = vim.g.neovide_scale_factor - 0.1<CR>")
	vim.keymap.set({ "n", "v" }, "<C-0>", ":lua vim.g.neovide_scale_factor = 1<CR>")
end
