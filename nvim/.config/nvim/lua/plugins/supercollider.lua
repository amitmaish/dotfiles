return {
	"davidgranstrom/scnvim",
	ft = "supercollider",
	config = function()
		local scnvim = require("scnvim")
		local sc_bootfile

		if vim.env.SC_BOOTFILE then
			sc_bootfile = vim.env.SC_BOOTFILE
		else
			sc_bootfile = "/Users/amit/.local/share/nvim/lazy/tidal.nvim/bootfiles/BootSuperDirt.scd"
		end

		local map = scnvim.map
		local map_expr = scnvim.map_expr
		scnvim.setup({
			sclang = {
				cmd = "/Applications/SuperCollider.app/Contents/MacOS/sclang",
				args = { sc_bootfile },
			},
		})

		if vim.env.SC_NOAUTOSTART == nil then
			vim.api.nvim_create_autocmd("User", {
				pattern = "TidalLaunch",
				callback = function()
					scnvim.start()
				end,
			})
		end
	end,
}
