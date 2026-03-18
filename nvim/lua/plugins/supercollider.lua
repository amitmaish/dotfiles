local function send_whole_file_raw(opts)
	local scnvim = require("scnvim")

	-- Read the file directly from disk to get raw content
	local filename = opts.args ~= "" and opts.args or vim.api.nvim_buf_get_name(0)

	local file = io.open(filename, "r")
	if not file then
		vim.notify("Could not read file: " .. filename, vim.log.levels.ERROR)
		return
	end

	local code = file:read("*a")
	file:close()

	-- Send the raw file content
	scnvim.send(code)
end

---@param default string?
local function Bootfile(default)
	if vim.env.SC_BOOTFILE then
		return vim.env.SC_BOOTFILE
	end
	return default
end

return {
	"davidgranstrom/scnvim",
	lazy = false,
	pin = true,
	config = function()
		local scnvim = require("scnvim")
		local which = require("config_utils").which

		local map = scnvim.map
		local map_expr = scnvim.map_expr
		scnvim.setup({
			sclang = {
				cmd = which("sclang"),
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
			snippet = {
				engine = {
					name = "luasnip",
					options = {
						descriptions = true,
					},
				},
			},
			postwin = {
				float = {
					enabled = true,
					config = { border = "rounded" },
				},
			},
			documentation = {
				cmd = which("pandoc"),
				horizontal = true,
				direction = "top",
				keymaps = true,
			},
		})

		if vim.env.SC_NOAUTOSTART == nil then
			vim.api.nvim_create_autocmd("User", {
				pattern = "TidalLaunch",
				callback = function()
					scnvim.start()

					local bootfile = Bootfile(vim.api.nvim_get_runtime_file("bootfiles/BootSuperDirt.scd", false)[1])
					send_whole_file_raw(bootfile)
				end,
			})
		end
	end,
}
