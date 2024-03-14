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
--                ensure_installed = {"lua_ls", "clangd"}
            }
            )
        end
    },
    {
        "neovim/nvim-lspconfig",
        config = function()
            local lspconfig = require("lspconfig")
 --           lspconfig.clangd.setup
 --           {
 --                   on_attach = function(client)
 --                   client.handlers["textDocument/publishDiagnostics"] = vim.lsp.with( vim.lsp.diagnostic.on_publish_diagnostics, { virtual_text = false, signs = false, underline = false, update_in_insert = false })
 --                   end,
 --           }
             
            --lspconfig.lua_ls.setup({})        
        end,
    }
}


