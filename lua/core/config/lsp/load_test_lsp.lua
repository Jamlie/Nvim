local client = vim.lsp.start_client({
	name = "EducationalLSP",
	cmd = { "/home/jam/go_playground/lsp/main" },
	on_attach = require("core.config.lsp.lspconfig").on_attach,
})

if not client then
	vim.notify("Failed to start EducationalLSP")
	return
end

vim.api.nvim_create_autocmd("FileType", {
	pattern = "markdown",
	callback = function()
		vim.lsp.buf_attach_client(0, client)
	end,
})
