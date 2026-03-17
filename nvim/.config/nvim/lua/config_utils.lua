--- utility function for my nvim
local M = {}

--- returns the output of the `which` command
---@param prog string
---@return string
function M.which(prog)
	local temp_prog = vim.fn.system("which " .. prog)
	return string.sub(temp_prog, 1, -3)
end

return M
