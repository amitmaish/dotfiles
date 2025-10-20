---@param default string?
local function Bootfile(default)
	if vim.env.SC_BOOTFILE then
		return vim.env.SC_BOOTFILE
	end
	return default
end

---@param file string
local function ReadFile(file)
	if file == nil then
		vim.notify("provide a file to the ReadFile function", vim.log.levels.ERROR)
		return
	end
	local f = assert(io.open(file, "r"), "bootfile not found")
	local content = f:read("a")
	return content
end

return {
	"davidgranstrom/scnvim",
	lazy = false,
	pin = true,
	config = function()
		local scnvim = require("scnvim")

		local map = scnvim.map
		local map_expr = scnvim.map_expr
		scnvim.setup({
			sclang = {
				cmd = "/Applications/SuperCollider.app/Contents/MacOS/sclang",
			},
			keymaps = {
				["<D-e>"] = map("editor.send_line", { "i", "n" }),
				["<C-e>"] = {
					map("editor.send_block", { "i", "n" }),
					map("editor.send_selection", "x"),
				},
				["<CR>"] = map("postwin.toggle"),
				["<M-CR>"] = map("postwin.toggle", "i"),
				["<M-L>"] = map("postwin.clear", { "n", "i" }),
				["<C-k>"] = map("signature.show", { "n", "i" }),
				["<F12>"] = map("sclang.hard_stop", { "n", "x", "i" }),
				["<leader>st"] = map("sclang.start"),
				["<leader>sk"] = map("sclang.recompile"),
				["<F1>"] = map_expr("s.boot"),
				["<F2>"] = map_expr("s.meter"),
			},
			editor = {
				highlight = {
					color = "IncSearch",
				},
			},
			postwin = {
				float = {
					enabled = true,
					config = { border = "rounded" },
				},
			},
			documentation = {
				cmd = "/usr/local/bin/pandoc",
			},
		})

		if vim.env.SC_NOAUTOSTART == nil then
			vim.api.nvim_create_autocmd("User", {
				pattern = "TidalLaunch",
				callback = function()
					scnvim.start()

					local bootfile =
						Bootfile(vim.env.HOME .. "~/.local/share/nvim/lazy/tidal.nvim/bootfiles/BootSuperDirt.scd")
					scnvim.send(ReadFile(bootfile))
				end,
			})
		end
	end,
}
