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
                ensure_installed = {"lua_ls", "clangd"}
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
                    --cmd = {"clangd", "--config=/home/dontuo/projects/minecraft_clone/.clangd"},
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


