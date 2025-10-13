return {
	"L3MON4D3/LuaSnip",
	-- follow latest release.
	version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
	-- install jsregexp (optional!).
	build = "make install_jsregexp",
	opts = {
		enable_autosnippets = true,
	},
	init = function()
		local appname
		if vim.env.NVIM_APPNAME ~= nil then
			appname = vim.env.NVIM_APPNAME
		else
			appname = "nvim"
		end
		require("luasnip.loaders.from_lua").load({ paths = { "~/.config/" .. appname .. "/snippets" } })

		local ls = require("luasnip")
		vim.keymap.set({ "i" }, "<C-e>", function()
			ls.expand()
		end, { silent = true })
		vim.keymap.set({ "i", "s" }, "<C-n>", function()
			ls.jump(1)
		end, { silent = true })
		vim.keymap.set({ "i", "s" }, "<C-p>", function()
			ls.jump(-1)
		end, { silent = true })

		local list_snips = function()
			local ft_list = require("luasnip").available()[vim.o.filetype]
			local ft_snips = {}
			for _, item in pairs(ft_list) do
				ft_snips[item.trigger] = item.name
			end
			print(vim.inspect(ft_snips))
		end
		vim.api.nvim_create_user_command("SnipList", list_snips, {})
	end,
}
