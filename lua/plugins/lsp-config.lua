

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
        ensure_installed = {
          "clangd",
          "jedi_language_server",
        },
      }
    end,
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      local function setup_diagnostics(client, bufnr)
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
      end

      -- C++
      vim.lsp.config("clangd", {
        on_attach = setup_diagnostics,
      })

      -- Python
      vim.lsp.config("jedi_language_server", {
        on_attach = setup_diagnostics,
      })
        
      vim.lsp.config("qmlls", {cmd = { "qmlls6" }, 
      filetypes = { "qml", "qmljs" }})

      -- LaTeX (example)
      vim.lsp.config("digestif", {
        -- cmd = { "digestif", "--stdio" },
        -- filetypes = { "tex" },
        -- root_dir = function(fname) return vim.fn.getcwd() end,
      })

      -- TypeScript / JavaScript
      --[[vim.lsp.config("tsserver", {
        on_attach = function(client, bufnr)
          setup_stics(client, bufnr)
          -- Example extra keymaps
          local opts = { buffer = bufnr, silent = true }
          vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
          vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
        end,
        filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact", "typescript.tsx" },
      })
      --]]

      -- enable them
      vim.lsp.enable { "clangd", "jedi_language_server", "digestif", "qmlls", } --"tsserver",  }

      -- optional autocommand for global mappings
      vim.api.nvim_create_autocmd("LspAttach", {
        callback = function(args)
          local bufnr = args.buf
          vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { buffer = bufnr, silent = true })
        end,
      })
    end,
  },
}
