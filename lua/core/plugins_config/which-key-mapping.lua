local keys = {}

keys["<C-h>"] = {
	mode = "n",
	"<C-w>h",
	"Switch to the buffer to the left",
}

keys["<C-l>"] = {
	mode = "n",
	"<C-w>l",
	"Switch to the buffer to the right",
}

keys["<C-k>"] = {
	mode = "n",
	"<C-w>k",
	"Switch to the buffer to the top",
}

keys["<C-j>"] = {
	mode = "n",
	"<C-w>j",
	"Switch to the buffer to the bottom",
}

keys["<leader>f"] = {
	name = "+Telescope",
	mode = "n",
	f = { "<cmd>Telescope find_files<CR>", "Find File" },
	a = { "<cmd>Telescope find_files<CR> hidden=true", "Find All Files" },
	w = { "<cmd>Telescope live_grep<CR>", "Live Grep" },
	b = { "<cmd>Telescope buffers<CR>", "Buffers" },
	g = {
		name = "+Git",
		b = { "<cmd>Telescope git_branches<CR>", "Git Branches" },
		c = { "<cmd>Telescope git_commits<CR>", "Git Commits" },
		s = { "<cmd>Telescope git_status<CR>", "Git Status" },
	},
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
	name = "LSP",
	mode = "n",
	a = {
		function()
			vim.lsp.buf.code_action()
		end,
		"Code Action"
	},
	d = { "<cmd>Trouble<CR>", "Trouble" },
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

keys["<Tab>"] = {
	mode = "n",
	"<cmd>BufferLineCycleNext<CR>",
	"Next Buffer",
}

keys["<S-Tab>"] = {
	mode = "n",
	"<cmd>BufferLineCyclePrev<CR>",
	"Previous Buffer",
}

keys["<leader>X"] = {
	mode = "n",
	"<cmd>BufferLineCloseOthers<CR>",
	"Close Other Buffers"
}

-- close current buffer
keys["<leader>x"] = {
	mode = "n",
	function()
		vim.cmd("bd")
	end,
	"Close Buffer",
}

keys["<leader>p"] = {
	mode = "n",
	"<cmd>BufferLinePick<CR>",
	"Pick Buffer",
}


keys["<leader>o"] = {
	name = "Harpoon",
	mode = "n",
	h = { "<cmd>lua require('harpoon.ui').toggle_quick_menu()<CR>", "Toggle Harpoon's Menu" },
	a = { "<cmd>lua require('harpoon.mark').add_file()<CR>", "Add File to Harpoon" },
	q = { "<cmd>lua require('harpoon.ui').nav_prev()<CR>", "Previous Harpoon Window" },
	e = { "<cmd>lua require('harpoon.ui').nav_next()<CR>", "Next Harpoon Window" },
}

keys["p"] = {
	mode = "x",
	'p:let @+=@0<CR>:let @"=@0<CR>',
	"Don't copy over visual selection after paste",
	opts = { silent = true },
}

vim.keymap.set(
	"v",
	"<leader>/",
	":lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>"
)

return keys
