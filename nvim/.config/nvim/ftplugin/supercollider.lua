---@param default string?
local function Bootfile(default)
	if vim.env.SC_BOOTFILE then
		return vim.env.SC_BOOTFILE
	end
	return default
end

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

-- Create command with optional file argument
vim.api.nvim_create_user_command("SCNvimSendFile", send_whole_file_raw, {
	nargs = "?", -- Optional argument
	complete = "file", -- File path completion
})

if vim.env.SC_NOAUTOSTART == nil then
	vim.api.nvim_create_autocmd("User", {
		pattern = "TidalLaunch",
		callback = function()
			require("scnvim").start()

			local bootfile = Bootfile(vim.api.nvim_get_runtime_file("bootfiles/BootSuperDirt.scd", false)[1])
			vim.cmd("SCNvimSendFile " .. bootfile)
		end,
	})
end

require("luasnip").add_snippets("supercollider", require("scnvim/utils").get_snippets())

WK.add({
	{ "<leader>pS", "<cmd>Telescope scdoc<cr>", desc = "pick supercollider docs" },
})
