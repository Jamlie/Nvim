require("core.config.catppuccin")
require("core.config.lualine")
require("core.config.nvim-tree")
require("core.config.treesitter")
require("core.config.telescope")
require("core.config.lspconfig")
require("core.config.completions")
local keys = require("core.config.which-key-mapping")

local wk = require("which-key")

wk.register(keys)
