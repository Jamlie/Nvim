vim.o.termguicolors = true

require("catppuccin").setup({
	flavour = "macchiato",
	background = {
		light = "latte",
		dark = "mocha",
	},
	-- color_overrides = {
	-- 	macchiato = {
	-- 		red = "#F7768E",
	-- 		blue = "#7AA2F7",
	-- 		green = "#7BED9F",
	-- 		yellow = "#E0AF68",
	-- 		mauve = "#D488FF",
	-- 	},
	-- },
	transparent_background = true,
	show_end_of_buffer = false,
	term_colors = false,
	dim_inactive = {
		enabled = false,
		shade = "dark",
		percentage = 0.15,
	},
	no_italic = false,
	no_bold = false,
	no_underline = false,
	styles = {
		comments = { "italic" },
		conditionals = { "italic" },
		loops = {},
		functions = {},
		keywords = {},
		strings = {},
		variables = {},
		numbers = {},
		booleans = {},
		properties = {},
		types = {},
		operators = {},
	},
	-- color_overrides = {},
	custom_highlights = {},
	integrations = {
		cmp = true,
		gitsigns = true,
		nvimtree = true,
		treesitter = true,
		notify = false,
		mini = {
			enabled = true,
			indentscope_color = "",
		},
	},
})
