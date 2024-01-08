local M = {}

function M.setup()
	local wk = require("which-key")

	vim.o.timeout = true
	vim.o.timeoutlen = 300
	wk.setup({
		plugins = {
			marks = true,
			registers = true,
			spelling = {
				enabled = true,
				suggestions = 20,
			},
		},
		window = {
			border = "single",
			position = "bottom",
			margin = { 1, 0, 1, 0 },
			padding = { 2, 2, 2, 2 },
		},
		layout = {
			height = { min = 4, max = 25 },
			width = { min = 20, max = 50 },
			spacing = 3,
			align = "left",
		},
		ignore_missing = false,
		hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ " },
		show_help = true,
		triggers = "auto",
		triggers_blacklist = {
			i = { "j", "k" },
			v = { "j", "k" },
		},
		triggers_whitelist = {},
	})

	local keys = require("core.config.mappings")
	wk.register(keys)
end

return M
