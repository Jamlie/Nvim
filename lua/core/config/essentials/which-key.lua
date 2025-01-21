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
		win = {
			no_overlap = true,
			-- width = 1,
			-- height = { min = 4, max = 25 },
			-- col = 0,
			-- row = math.huge,
			border = "single",
			padding = { 2, 2, 2, 2 }, -- extra window padding [top/bottom, right/left]
			title = true,
			title_pos = "center",
			zindex = 1000,
			-- Additional vim.wo and vim.bo options
			bo = {},
			wo = {
				-- winblend = 10, -- value between 0-100 0 for fully opaque and 100 for fully transparent
			},
		},

		layout = {
			height = { min = 4, max = 25 },
			width = { min = 20, max = 50 },
			spacing = 3,
			align = "left",
		},
		show_help = true,
		triggers = {
			{ "<auto>", mode = "nxso" },
		},
		triggers_whitelist = {},
	})

	local keys = require("core.config.mappings")
	wk.add(keys)
end

return M
