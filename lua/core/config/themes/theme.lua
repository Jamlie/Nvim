local M = {}

function M.setTheme(theme)
	vim.cmd.colorscheme(theme)
end

return M
