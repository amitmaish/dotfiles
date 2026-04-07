vim.api.nvim_create_autocmd("PackChanged", {
	callback = function(ev)
		local name, kind = ev.data.spec.name, ev.data.kind
		if name == "telescope-fzf-native" and kind == "update" then
			vim.system({ "make" }, { cwd = ev.data.path })
		end
	end,
})

vim.pack.add({
	"https://github.com/nvim-lua/plenary.nvim",
	"https://github.com/nvim-telescope/telescope-fzf-native.nvim",
	"https://github.com/JoseConseco/telescope_sessions_picker.nvim",
	"https://github.com/davidgranstrom/telescope-scdoc.nvim",
	"https://github.com/nvim-telescope/telescope.nvim",
})

local telescope = require("telescope")
telescope.setup({
	extensions = {
		sessions_picker = {
			sessions_dir = vim.fn.stdpath("data") .. "/session/",
		},
	},
})
telescope.load_extension("sessions_picker")
telescope.load_extension("scdoc")

require("which-key").add({
	{
		"<leader> ",
		require("telescope.builtin").find_files,
		desc = "telescope files",
	},
	{
		"<leader>pf",
		require("telescope.builtin").git_files,
		desc = "telescope git files",
	},
	{
		"<leader>ph",
		require("telescope.builtin").help_tags,
		desc = "telescope help tags",
	},
	{
		"<leader>pg",
		require("telescope.builtin").live_grep,
		desc = "telescope grep",
	},
	{
		"<leader>pb",
		require("telescope.builtin").buffers,
		desc = "telescope buffers",
	},
	{
		"<leader>pp",
		require("telescope.builtin").builtin,
		desc = "telescope builtins",
	},
	{
		"<leader>pc",
		require("telescope.builtin").colorscheme,
		desc = "telescope colorschemes",
	},
})
