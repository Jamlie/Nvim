local opt = vim.opt
local o = vim.o
local map = vim.keymap.set
local wo = vim.wo
local g = vim.g
local api = vim.api

opt.termguicolors = true
opt.relativenumber = true
opt.clipboard = "unnamedplus"
opt.number = true
opt.smartindent = true

opt.tabstop = 2
opt.softtabstop = 2
opt.shiftwidth = 2
opt.expandtab = false

opt.colorcolumn = "128"

opt.updatetime = 250
opt.undofile = true

wo.wrap = true

g.mapleader = " "

o.whichwrap = o.whichwrap .. "<,>,[,],l,h"

o.fileencoding = "UTF-8"

-- vim.g.copilot_no_tab_map = true
-- vim.g.copilot_assume_mapped = true
-- vim.api.nvim_set_keymap("i", "<C-j>", 'copilot#Accept("<CR>")', { expr = true, noremap = true })
-- vim.api.nvim_set_keymap("i", "<C-h>", 'copilot#Previous()', { expr = true, noremap = true })
-- vim.api.nvim_set_keymap("i", "<C-k>", 'copilot#Next()', { expr = true, noremap = true })
api.nvim_set_keymap('n', '<C-b>', '<C-b>zz', { noremap = true })
api.nvim_set_keymap('n', '<C-u>', '<C-u>zz', { noremap = true })
api.nvim_set_keymap('n', '<C-d>', '<C-d>zz', { noremap = true })
api.nvim_set_keymap('n', 'n', 'nzzzv', { noremap = true })
api.nvim_set_keymap('n', 'N', 'Nzzzv', { noremap = true })

vim.cmd([[command! -bar -bang -nargs=? Wq w<bang> | q<bang>]])
vim.cmd([[command! -bar -bang -nargs=? Wa w<bang> | a<bang>]])

map(
	"n",
	"<leader>ie",
	"oif err != nil {<CR>}<Esc>Olog.Fatal(err)<Esc>oreturn err",
	{ desc = "Go Error Handling" }
)

map(
	"n",
	"<Esc>",
	":noh<CR>",
	{ noremap = true }
)

map(
	"n",
	"<C-s>",
	":w<CR>",
	{ noremap = true }
)

map(
	"n",
	"<C-c>",
	":%y+<CR>",
	{ noremap = true }
)

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

-- :ToggleTerm size=40 direction=float

opt.shell = "pwsh.exe -NoLogo"
opt.shellcmdflag =
"-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.Encoding]::UTF8;"
vim.cmd [[
  let &shellredir = '2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode'
  let &shellpipe = '2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode'
  set shellquote= shellxquote=
]]

