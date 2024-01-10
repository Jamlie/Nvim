local M = {}

function M.setup()
	local default_terminal = {
		type = "terminal",
		command = nil,
		width = 69,
		height = 8,
		opts = {
			redraw = true,
			window_config = {},
		},
	}

	local default_header = {
		type = "text",
		val = styles.style.banner,
		opts = {
			position = "center",
			hl = "Type",
		},
	}

	local footer = {
		type = "text",
		val = "",
		opts = {
			position = "center",
			hl = "Number",
		},
	}

	local dashboard = require("alpha.themes.dashboard")

	local btn = dashboard.button

	local buttons = {
		type = "group",
		val = {
			btn("e", styles.style.icons.documents.file .. "	New File", ":ene <BAR> startinsert <CR>"),
			btn("SPC f f", styles.style.icons.documents.find .. "	Find File", ":Telescope find_files <CR>"),
			btn("SPC f w", styles.style.icons.misc.telescope .. "	Find Word", ":Telescope live_grep <CR>"),
			btn("SPC f h", styles.style.icons.documents.restart .. "	Find History", ":Telescope oldfiles <CR>"),
			btn(
				"SPC o h",
				styles.style.icons.documents.harpoon_files .. "	Open Harpoon",
				":lua require('harpoon.ui').toggle_quick_menu()<CR>"
			),
			btn("q", styles.style.icons.misc.close .. "	Quit", ":qa <CR>"),
		},
		opts = {
			spacing = 1,
		},
	}

	local sections = {
		terminal = default_terminal,
		header = default_header,
		buttons = buttons,
		footer = footer,
	}

	local config = {
		layout = {
			{ type = "padding", val = 2 },
			sections.header,
			{ type = "padding", val = 2 },
			sections.buttons,
			sections.footer,
		},
		opts = {
			margin = 5,
		},
	}

	require("alpha").setup(config)
end

return M
