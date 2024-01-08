local opt = vim.opt
local o = vim.o
local wo = vim.wo
local g = vim.g

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

opt.shell = "pwsh.exe -NoLogo"
opt.shellcmdflag =
"-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.Encoding]::UTF8;"
vim.cmd [[
  let &shellredir = '2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode'
  let &shellpipe = '2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode'
  set shellquote= shellxquote=
]]
