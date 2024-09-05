return
{
    "ray-x/lsp_signature.nvim",
    event = "VeryLazy",
    opts = {},
    config = function()
        signature = require('lsp_signature')
        signature.setup()

        signature.toggle_float_win()
        vim.keymap.set('i', '<C-a>', function() require('lsp_signature').toggle_float_win() end, { silent = false, noremap = true, desc = 'toggle signature' })
        
    end
}
