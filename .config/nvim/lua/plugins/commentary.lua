return {
	{
		"tpope/vim-commentary",
		config = function()
			vim.cmd [[nmap <D-/> <Plug>CommentaryLine]]
			vim.cmd [[imap <D-/> <esc><Plug>CommentaryLine'^a]]
		end,
	},
}
