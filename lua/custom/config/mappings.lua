local M = {
	["<leader>c"] = {
		mode = "n",
		t = {
			function()
				require("telescope.builtin").colorscheme({
					prompt_title = "Change Theme",
				})
			end,
			"Change Theme",
		},
	},
}

return M
