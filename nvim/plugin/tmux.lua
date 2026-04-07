vim.pack.add({ "https://github.com/christoomey/vim-tmux-navigator" })

require("which-key").add({
	{ "<c-h>", "<cmd>TmuxNavigateLeft<cr>" },
	{ "<c-j>", "<cmd>TmuxNavigateDown<cr>" },
	{ "<c-k>", "<cmd>TmuxNavigateUp<cr>" },
	{ "<c-l>", "<cmd>TmuxNavigateRight<cr>" },
	{ "<c-\\>", "<cmd>TmuxNavigatePrevious<cr>" },
})
