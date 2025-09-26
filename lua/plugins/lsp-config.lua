
return {
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup {
        ensure_installed = { "clangd", "jedi_language_server" },
      }
    end,
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      -- Instead of requiring lspconfig, use the native LSP config API:
      --- define (or extend) server config
      vim.lsp.config("clangd", {
        on_attach = function(client, bufnr)
          client.handlers["textDocument/publishDiagnostics"] =
            vim.lsp.with(
              vim.lsp.diagnostic.on_publish_diagnostics,
              {
                virtual_text = true,
                signs = false,
                underline = false,
                update_in_insert = false,
              }
            )
        end,
        -- you can also supply cmd, filetypes, root_dir, settings, etc.
      })

      vim.lsp.config("jedi_language_server", {
        on_attach = function(client, bufnr)
          client.handlers["textDocument/publishDiagnostics"] =
            vim.lsp.with(
              vim.lsp.diagnostic.on_publish_diagnostics,
              {
                virtual_text = true,
                signs = false,
                underline = false,
                update_in_insert = false,
              }
            )
        end,
        -- additional settings if needed
      })

      -- If you have a server that isn’t part of lspconfig's defaults:
      vim.lsp.config("digestif", {
        -- must provide at least `cmd`, `filetypes`, `root_dir` if not defined by default
        -- e.g.:
        -- cmd = { "digestif", "--stdio" },
        -- filetypes = { "digestif" },
        -- root_dir = function(...) ...
      })

      -- Enable the servers you want, so they auto-start when filetype matches
      vim.lsp.enable { "clangd", "jedi_language_server", "digestif" }

      -- Optionally, set up LspAttach for buffer-local mappings, etc.
      vim.api.nvim_create_autocmd("LspAttach", {
        callback = function(args)
          local client = vim.lsp.get_client_by_id(args.data.client_id)
          local bufnr = args.buf
          -- e.g. set a keymap:
          -- vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = bufnr, silent = true })
          -- you can also disable diagnostics override here, etc.
        end,
      })
    end,
  },
}
