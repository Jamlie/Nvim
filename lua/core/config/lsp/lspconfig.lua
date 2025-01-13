require("neodev").setup()

local lspconfig = require("lspconfig")

require("mason").setup()
local mason_lspconfig = require("mason-lspconfig")
mason_lspconfig.setup({
    ensure_installed = {
        "lua_ls",
        "tsserver",
        "gopls",
        "rust_analyzer",
        "pyright",
        "html",
    },
})

local on_attach = function(client, _)
    vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
    vim.keymap.set("n", "L", vim.lsp.diagnostic.set_loclist, { silent = true })

    local active_clients = vim.lsp.get_active_clients()
    if client.name == "denols" then
        for _, client_ in pairs(active_clients) do
            if client_.name == "tsserver" then
                client_.stop()
            end
        end
    elseif client.name == "tsserver" then
        for _, client_ in pairs(active_clients) do
            if client_.name == "denols" then
                client.stop()
            end
        end
    end
end

local capabilities = require("cmp_nvim_lsp").default_capabilities()

local lsp_names = mason_lspconfig.get_installed_servers()

for _, lsp_name in ipairs(lsp_names) do
    if lspconfig[lsp_name] then
        if lsp_name == "rust_analyzer" then
            goto continue
        end

        if lsp_name == "tailwindcss" then
            lspconfig.tailwindcss.setup({
                on_attach = on_attach,
                capabilities = capabilities,
                filetypes = { "templ", "astro", "javascript", "typescript", "react", "typescriptreact", "javascriptreact", "html" },
                settings = {
                    tailwindCSS = {
                        includeLanguages = {
                            templ = "html",
                        },
                    },
                },
            })
            goto continue
        end

        if lsp_name == "lua_lsp" then
            lspconfig.lua_ls.setup({
                on_attach = on_attach,
                capabilities = capabilities,
                settings = {
                    Lua = {
                        runtime = {
                            version = "LuaJIT",
                        },
                        diagnostics = {
                            globals = {
                                "vim",
                                "require",
                            },
                        },
                        workspace = {
                            library = {
                                library = vim.api.nvim_get_runtime_file("", true),
                            },
                        },
                    },
                },
            })
            goto continue
        end

        if lsp_name == "templ" then
            lspconfig.templ.setup({
                on_attach = on_attach,
                flags = {
                    debounce_text_changes = 150,
                },
                filetypes = { "templ" },
            })
            goto continue
        end

        if lsp_name == "tsserver" then
            lspconfig.tsserver.setup({
                on_attach = on_attach,
                capabilities = capabilities,
                root_dir = function(filename, _)
                    local denoRootDir = lspconfig.util.root_pattern("deno.json", "deno.json")(filename)
                    if denoRootDir then
                        return nil
                    end

                    return lspconfig.util.root_pattern("package.json")(filename)
                end,
                single_file_support = false,
            })
            goto continue
        end

        if lsp_name == "denols" then
            lspconfig.denols.setup({
                on_attach = on_attach,
                capabilities = capabilities,
                root_dir = lspconfig.util.root_pattern("deno.json", "deno.jsonc"),
                init_options = {
                    lint = true,
                    unstable = true,
                    suggest = {
                        imports = {
                            hosts = {
                                ["https://deno.land"] = true,
                                ["https://cdn.nest.land"] = true,
                                ["https://crux.land"] = true,
                            },
                        },
                    },
                },
            })
            goto continue
        end

        lspconfig[lsp_name].setup({
            on_attach = on_attach,
            capabilities = capabilities,
        })
    else
        vim.notify("LSP server '" .. lsp_name .. "' is not available in lspconfig", vim.log.levels.WARN)
    end
    ::continue::
end

return {
    on_attach = on_attach,
}
