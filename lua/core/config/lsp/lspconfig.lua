local lspconfig = require("lspconfig")

require("mason").setup()
require("mason-lspconfig").setup({
	ensure_installed = { "lua_ls", "tsserver", "gopls", "rust_analyzer", "pyright" },
})

local on_attach = function(_, _)
	vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
	vim.keymap.set("n", "L", vim.lsp.diagnostic.set_loclist, { silent = true })
end

local capabilities = require("cmp_nvim_lsp").default_capabilities()

lspconfig.lua_ls.setup({
	on_attach = on_attach,
	capabilities = capabilities,
})

lspconfig.tsserver.setup({
	on_attach = on_attach,
	capabilities = capabilities,
})

lspconfig.gopls.setup({
	on_attach = on_attach,
	capabilities = capabilities,
})

lspconfig.zls.setup({
	on_attach = on_attach,
	capabilities = capabilities,
})

lspconfig.bashls.setup({
    on_attach = on_attach,
    capabilities = capabilities,
})

lspconfig.pyright.setup({
	on_attach = on_attach,
	capabilities = capabilities,
})

lspconfig.html.setup({
	on_attach = on_attach,
	capabilities = capabilities,
})

lspconfig.tailwindcss.setup({
	on_attach = on_attach,
	capabilities = capabilities,
})

-- svelte
lspconfig.svelte.setup({
    on_attach = on_attach,
    capabilities = capabilities,
})

lspconfig.templ.setup({
	on_attach = on_attach,
	flags = {
		debounce_text_changes = 150,
	},
	filetypes = { "templ" },
})

lspconfig.intelephense.setup({
    on_attach = on_attach,
    capabilities = capabilities,
})
