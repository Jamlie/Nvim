local M = {}
local map = vim.keymap.set

M["<leader>k"] = {
	name = "RustLSP",
	mode = "n",
	"<cmd>RustLsp hover actions<CR>",
	"Rust Hover Actions",
}

M["<leader>d"] = {
	name = "Debug",
	mode = "n",
	b = {
		"<cmd>DapToggleBreakpoint<CR>",
		"Toggle Breakpoint",
	},
	us = {
		function()
			local widgets = require("dap.ui.widgets")
			local sidebar = widgets.sidebar(widgets.scopes)
			sidebar.open()
		end,
		"Show Scopes",
	},
	gt = {
		function()
			require("dap-go").debug_test()
		end,
		"Debug Test",
	},
	gl = {
		function()
			require("dap-go").debug_last()
		end,
		"Debug Last",
	},
}

M["<C-b>"] = {
	name = "Scrolling",
	mode = "n",
	"<C-b>zz",
	"Scroll Up",
	{ noremap = true },
}

M["<C-u>"] = {
	name = "Scrolling",
	mode = "n",
	"<C-u>zz",
	"Scroll Up",
	{ noremap = true },
}

M["<C-d>"] = {
	name = "Scrolling",
	mode = "n",
	"<C-d>zz",
	"Scroll Down",
	{ noremap = true },
}

M["<C-n>"] = {
	name = "NvimTree",
	mode = "n",
	"<cmd>NvimTreeFindFileToggle<CR>",
	"Toggle NvimTree",
	{ noremap = true },
}

M["n"] = {
	name = "Search",
	mode = "n",
	"nzzzv",
	"Next",
	{ noremap = true },
}

M["N"] = {
	name = "Search",
	mode = "n",
	"Nzzzv",
	"Previous",
	{ noremap = true },
}

vim.cmd([[command! -bar -bang -nargs=? Wq w<bang> | q<bang>]])
vim.cmd([[command! -bar -bang -nargs=? Wa w<bang> | a<bang>]])

M["<leader>ie"] = {
	name = "Error Handling",
	mode = "n",
	"oif err != nil {<CR>}<Esc>O\tlog.Fatal(err)<Esc>oreturn err",
	"Golang Error Handling",
}

M["<Esc>"] = {
	name = "Escape",
	mode = "n",
	"<cmd>noh<CR>",
	"Clear Highlight",
}

M["<C-s>"] = {
	name = "Save",
	mode = "n",
	"<cmd>w<CR>",
	"Save",
}

M["<C-c>"] = {
	name = "Copy",
	mode = "n",
	":%y+<CR>",
	"Copy to Clipboard",
}

map(
	"v",
	"J",
	":m '>+1<CR>gv=gv",
	{ desc = "Move line down" }
)

map(
	"v",
	"K",
	":m '<-2<CR>gv=gv",
	{ desc = "Move line up" }
)

M["<leader>g"] = {
	name = "+Git",
	mode = "n",
	s = { "<cmd>LazyGit<CR>", "Open LazyGit" },
}

M["<leader>f"] = {
	name = "+Telescope",
	mode = "n",
	f = { "<cmd>Telescope find_files<CR>", "Find File" },
	a = { "<cmd>Telescope find_files<CR> hidden=true", "Find All Files" },
	w = { "<cmd>Telescope live_grep<CR>", "Live Grep" },
	b = { "<cmd>Telescope buffers<CR>", "Buffers" },
	h = { "<cmd>Telescope oldfiles<CR>", "History" },
	g = {
		name = "+Git",
		b = { "<cmd>Telescope git_branches<CR>", "Git Branches" },
		c = { "<cmd>Telescope git_commits<CR>", "Git Commits" },
		s = { "<cmd>Telescope git_status<CR>", "Git Status" },
	},
}

M["<leader>c"] = {
	name = "LSP",
	mode = "n",
	a = {
		function()
			vim.lsp.buf.code_action()
		end,
		"Code Action"
	},
	t = { "<cmd>Trouble<CR>", "Trouble" },
	f = { "<cmd>lua vim.lsp.buf.formatting()<CR>", "Format" },
	d = { "<cmd>lua vim.diagnostic.open_float()<CR>", "Diagnostic" },
	r = {
		function()
			vim.lsp.buf.rename()
		end,
		"Rename"
	},
}

M["g"] = {
	mode = "n",
	d = { vim.lsp.buf.definition, "Definition" },
	D = { vim.lsp.buf.declaration, "Declaration" },
	i = { vim.lsp.buf.implementation, "Implementation" },
	t = { vim.lsp.buf.type_definition, "Type Definition" },
	r = { require("telescope.builtin").lsp_references, "References" },
}

M["<Tab>"] = {
	mode = "n",
	"<cmd>BufferLineCycleNext<CR>",
	"Next Buffer",
}

M["<S-Tab>"] = {
	mode = "n",
	"<cmd>BufferLineCyclePrev<CR>",
	"Previous Buffer",
}

M["<leader>x"] = {
	name = "Close Buffer",
	mode = "n",
	function()
		vim.cmd("bd")
	end,
	"Close Buffer",
}

M["<leader>X"] = {
	name = "Close Buffer",
	mode = "n",
	"<cmd>BufferLineCloseOthers<CR>",
	"Close Other Buffers"
}

M["<leader>p"] = {
	name = "Pick Buffer",
	mode = "n",
	"<cmd>BufferLinePick<CR>",
	"Pick Buffer",
}

-- harpoon
M["<leader>o"] = {
	name = "Harpoon",
	mode = "n",
	h = { "<cmd>lua require('harpoon.ui').toggle_quick_menu()<CR>", "Toggle Harpoon's Menu" },
	a = { "<cmd>lua require('harpoon.mark').add_file()<CR>", "Add File to Harpoon" },
	q = { "<cmd>lua require('harpoon.ui').nav_prev()<CR>", "Previous Harpoon Window" },
	e = { "<cmd>lua require('harpoon.ui').nav_next()<CR>", "Next Harpoon Window" },
}

-- paste without overwriting the current selection
M["p"] = {
	mode = "x",
	'p:let @+=@0<CR>:let @"=@0<CR>',
	"Don't copy over visual selection after paste",
	opts = { silent = true },
}

M["<C-h>"] = {
	mode = "n",
	"<C-w>h",
	"Switch to the buffer to the left",
}

M["<C-l>"] = {
	mode = "n",
	"<C-w>l",
	"Switch to the buffer to the right",
}

M["<C-k>"] = {
	mode = "n",
	"<C-w>k",
	"Switch to the buffer to the top",
}

M["<C-j>"] = {
	mode = "n",
	"<C-w>j",
	"Switch to the buffer to the bottom",
}

M["<leader>/"] = {
	mode = "n",
	function()
		require('Comment.api').toggle.linewise.current()
	end,
	"Toggle Comment"
}

vim.keymap.set(
	"v",
	"<leader>/",
	":lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>",
	{ desc = "Toggle Comment" }
)

return M
