local M = {}
local map = vim.keymap.set

M["<leader>-"] = {
    name = "Oil",
    mode = "n",
    "<cmd>Oil<CR>",
    "Open Oil",
    { noremap = true, silent = true },
}

M["K"] = {
	name = "RustLSP",
	mode = "n",
	"<cmd>RustLsp hover actions<CR>",
	"Rust Hover Actions",
}

M["<leader>u"] = {
	name = "UndoTree",
	mode = "n",
	t = { "<cmd>UndotreeToggle<CR>", "Toggle UndoTree" },
	f = { "<cmd>UndotreeFocus<CR>", "Toggle Focus" },
}

M["<leader>d"] = {
	name = "Debug",
	mode = "n",
	b = {
		"<cmd>DapToggleBreakpoint<CR>",
		"Toggle Breakpoint",
	},
	t = {
		"<cmd>DapTerminate<CR>",
		"Terminate",
	},
	u = {
		name = "UI",
		s = {
			function()
				local widgets = require("dap.ui.widgets")
				local sidebar = widgets.sidebar(widgets.scopes)
				sidebar.open()
			end,
			"Show Scopes",
		},
	},
	c = {
		"<cmd>DapContinue<CR>",
		"Continue",
	},
	s = {
		name = "Step",
		i = {
			"<cmd>DapStepInto<CR>",
			"Into",
		},
		u = {
			"<cmd>DapStepOut<CR>",
			"Out",
		},
		o = {
			"<cmd>DapStepOver<CR>",
			"Over",
		},
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

-- M["<C-n>"] = {
-- 	name = "NvimTree",
-- 	mode = "n",
-- 	"<cmd>NvimTreeFindFileToggle<CR>",
-- 	"Toggle NvimTree",
-- 	{ noremap = true },
-- }

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
	"oif err != nil {<CR>}<Esc>Oreturn err<Esc>",
	"Golang Error Handling",
}

M["<Esc>"] = {
	name = "Escape",
	mode = "n",
	"<cmd>noh<CR>",
	"Clear Highlight",
}

M["<C-c>"] = {
	name = "Copy",
	mode = "n",
	":%y+<CR>",
	"Copy to Clipboard",
}

map("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move line down", noremap = true, silent = true })

map("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move line up", noremap = true, silent = true })

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
		"Code Action",
	},
	t = { "<cmd>Trouble<CR>", "Trouble" },
	f = { "<cmd>lua vim.lsp.buf.formatting()<CR>", "Format" },
	d = { "<cmd>lua vim.diagnostic.open_float()<CR>", "Diagnostic" },
	r = {
		function()
			vim.lsp.buf.rename()
		end,
		"Rename",
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

M["<leader>t"] = {
	mode = "n",
	h = {
		function()
			require("telescope.builtin").colorscheme({
				prompt_title = "Change Theme",
			})
		end,
		"Themes",
	},
}

M["<leader>x"] = {
	name = "Close Buffer",
	mode = "n",
	function()
		vim.cmd("bd")
	end,
	"Close Buffer",
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
		require("Comment.api").toggle.linewise.current()
	end,
	"Toggle Comment",
}

vim.keymap.set(
	"v",
	"<leader>/",
	":lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>",
	{ desc = "Toggle Comment", noremap = true, silent = true }
)

local custom = require("custom.override")
if custom.mappings then
	for key, mapping in pairs(custom.mappings) do
		M[key] = mapping
	end
end

return M
