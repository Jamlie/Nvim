local M = {}

local icons = styles.style.icons.logo

function M.setup()
	require("nvim-web-devicons").setup({
		override = {
			toml = {
				icon = icons.toml,
				color = "#61afef",
				name = "Toml",
			},
			js = {
				icon = icons.js,
				color = "#e5c07b",
				name = "JavaScript",
			},
			cjs = {
				icon = icons.js,
				color = "#e5c07b",
				name = "JavaScript",
			},
			mjs = {
				icon = icons.js,
				color = "#e5c07b",
				name = "JavaScript",
			},
			class = {
				icon = icons.java,
				color = "#61afef",
				name = "Class",
			},
		},
	})
end

return M
