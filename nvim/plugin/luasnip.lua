vim.api.nvim_create_autocmd("PackChanged", {
	callback = function(ev)
		local name, kind = ev.data.spec.name, ev.data.kind
		if name == "LuaSnip" and kind == "update" then
			vim.system({ "make", "install_jsregexp" }, { cwd = ev.data.path })
		end
	end,
})

vim.pack.add({
	{
		src = "https://github.com/L3MON4D3/LuaSnip",
		version = vim.version.range("v2.*"),
	},
})

require("luasnip").setup({
	enable_autosnippets = true,
	update_events = { "TextChanged", "TextChangedI" },
})

local appname
if vim.env.NVIM_APPNAME ~= nil then
	appname = vim.env.NVIM_APPNAME
else
	appname = "nvim"
end
require("luasnip.loaders.from_lua").load({ paths = { "~/.config/" .. appname .. "/snippets" } })

-- require("luasnip").add_snippets("supercollider", require("scnvim/utils").get_snippets())

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
