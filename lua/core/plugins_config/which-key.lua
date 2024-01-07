local keys = {}

keys["<leader>f"] = {
	mode = "n",
	f = { "<cmd>Telescope find_files<CR>", "Find File" },
	w = { "<cmd>Telescope live_grep<CR>", "Live Grep" },
	b = { "<cmd>Telescope buffers<CR>", "Buffers" },
}

keys["<leader>g"] = {
	mode = "n",
	c = { "<cmd>Telescope git_commits<CR>", "Git Commits" },
	b = { "<cmd>Telescope git_branches<CR>", "Git Branches" },
}

keys["<leader>r"] = {
	mode = "n",
	n = {
		function()
			vim.lsp.buf.rename()
		end,
		"Rename"
	},
}

keys["<leader>c"] = {
	mode = "n",
	a = {
		function()
			vim.lsp.buf.code_action()
		end,
		"Code Action"
	}
}

keys["<leader>/"] = {
	mode = "n",
	function()
		require('Comment.api').toggle.linewise.current()
	end,
	"Toggle Comment"
}

keys["g"] = {
	mode = "n",
	d = { vim.lsp.buf.definition, "Definition" },
	i = { vim.lsp.buf.implementation, "Implementation" },
	r = { require("telescope.builtin").lsp_references, "References" },
}

vim.keymap.set(
	"v",
	"<leader>/",
	":lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>"
)

return keys
