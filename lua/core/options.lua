local opt = vim.opt
local o = vim.o
local wo = vim.wo
local g = vim.g
local api = vim.api
local uv = vim.loop

opt.termguicolors = true
opt.relativenumber = true
opt.clipboard = "unnamedplus"
opt.number = true
opt.smartindent = true

opt.tabstop = 4
opt.softtabstop = 4
opt.shiftwidth = 4
opt.expandtab = true

opt.colorcolumn = "128"
opt.scrolloff = 6

opt.updatetime = 250
opt.undofile = true

wo.wrap = true

g.mapleader = " "

o.whichwrap = o.whichwrap .. "<,>,[,],l,h"

o.fileencoding = "UTF-8"
vim.cmd([[set guicursor=n-v-c-i:block]])

api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking text",
	callback = function()
		vim.highlight.on_yank()
	end,
})

local this_os = uv.os_uname().sysname

if this_os:find("Windows") then
	opt.shell = "pwsh.exe -NoLogo"
	opt.shellcmdflag =
		"-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.Encoding]::UTF8;"
	vim.cmd([[
		let &shellredir = '2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode'
		let &shellpipe = '2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode'
		set shellquote= shellxquote=
	]])
end
