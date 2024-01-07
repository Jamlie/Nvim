vim.opt.relativenumber = true
vim.opt.clipboard = "unnamedplus"
vim.opt.number = true
vim.opt.smartindent = true

vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = false

vim.opt.colorcolumn = "128"

vim.opt.updatetime = 250
vim.opt.undofile = true

vim.wo.wrap = true

vim.g.mapleader = " "

vim.o.whichwrap = vim.o.whichwrap .. "<,>,[,],l,h"

-- vim.g.copilot_no_tab_map = true
-- vim.g.copilot_assume_mapped = true
-- vim.api.nvim_set_keymap("i", "<C-j>", 'copilot#Accept("<CR>")', { expr = true, noremap = true })
-- vim.api.nvim_set_keymap("i", "<C-h>", 'copilot#Previous()', { expr = true, noremap = true })
-- vim.api.nvim_set_keymap("i", "<C-k>", 'copilot#Next()', { expr = true, noremap = true })
vim.api.nvim_set_keymap('n', '<C-b>', '<C-b>zz', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-i>', ':Telescope', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-u>', '<C-u>zz', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-d>', '<C-d>zz', { noremap = true })
vim.api.nvim_set_keymap('n', 'n', 'nzzzv', { noremap = true })
vim.api.nvim_set_keymap('n', 'N', 'Nzzzv', { noremap = true })

vim.cmd([[command! -bar -bang -nargs=? Wq w<bang> | q<bang>]])
vim.cmd([[command! -bar -bang -nargs=? Wa w<bang> | a<bang>]])

vim.keymap.set(
	"n",
	"<leader>ie",
	"oif err != nil {<CR>}<Esc>Olog.Fatal(err)<Esc>oreturn err"
)

vim.keymap.set(
	"n",
	"<Esc>",
	":noh<CR>",
	{ noremap = true }
)

vim.keymap.set(
	"n",
	"<C-s>",
	":w<CR>",
	{ noremap = true }
)

vim.keymap.set(
	"n",
	"<C-c>",
	":%y+<CR>",
	{ noremap = true }
)

vim.keymap.set(
	"n",
	"p",
	'p:let @+=@0<CR>:let @"=@0<CR>'
)

-- :ToggleTerm size=40 direction=float

-- vim.keymap.set("n", "<leader>oh", ":lua require('harpoon.ui').toggle_quick_menu()<CR>", { noremap = true })
-- vim.keymap.set("n", "<leader>oa", ":lua require('harpoon.mark').add_file()<CR>", { noremap = true })
-- vim.keymap.set("n", "<leader>oq", ":lua require('harpoon.ui').nav_prev()<CR>", { noremap = true })
-- vim.keymap.set("n", "<leader>oe", ":lua require('harpoon.ui').nav_next()<CR>", { noremap = true })


vim.opt.shell = "pwsh.exe -NoLogo"
vim.opt.shellcmdflag =
"-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.Encoding]::UTF8;"
vim.cmd [[
  let &shellredir = '2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode'
  let &shellpipe = '2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode'
  set shellquote= shellxquote=
]]



