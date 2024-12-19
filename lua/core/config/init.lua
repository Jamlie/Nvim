require("core.config.themes.catppuccin")
require("core.config.ui.lualine")
require("core.config.essentials.treesitter")
require("core.config.themes.theme").setTheme(require("custom.override").theme or "catppuccin")
require("core.config.essentials.telescope")
require("core.config.lsp.lspconfig")
-- require("core.config.lsp.load_test_lsp")
require("core.config.lsp.completions")
require("core.config.lsp.rust")
require("flutter-tools").setup({})
