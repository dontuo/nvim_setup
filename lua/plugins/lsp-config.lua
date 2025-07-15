return {
    {
    "williamboman/mason.nvim",
    config = function()
        require("mason").setup()
    end
    },
    {
        "williamboman/mason-lspconfig.nvim",
        config = function()
            require("mason-lspconfig").setup(
            {
                ensure_installed = {"clangd", "jedi_language_server"}
            }
            )
        end
    },
    {
        "neovim/nvim-lspconfig",
        config = function()
            local lspconfig = require("lspconfig")
            lspconfig.clangd.setup
            {
                    on_attach = function(client)
                        client.handlers["textDocument/publishDiagnostics"] = vim.lsp.with( 
                            vim.lsp.diagnostic.on_publish_diagnostics, 
                            { 
                                virtual_text = true, signs = false, underline = false, update_in_insert = false 
                            }
                        )
                    end,
            }

            lspconfig.digestif.setup{}
            
        --[[lspconfig.ccls.setup{
            init_options = {
                cache = { directory = ".ccls-cache" },
              }
        } 
        --on_attach = require("my.attach").func,
        --capabilities = my_caps_table_or_func
    --} --]]
             --[[{
                init_options = {
                    cache = {
                    directory = ".ccls-cache";
                },
                filetypes = {"c", "cpp", "opencl"}
            }
        }--]]

            lspconfig.jedi_language_server.setup
            {
                on_attach = function(client)
                        client.handlers["textDocument/publishDiagnostics"] = vim.lsp.with( 
                            vim.lsp.diagnostic.on_publish_diagnostics, 
                            { 
                                virtual_text = true, signs = false, underline = false, update_in_insert = false 
                            }
                        )
                    end,
            }

            --vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})
            --lspconfig.lua_ls.setup({})        
        end,
    }
}


