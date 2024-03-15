vim.cmd("set tabstop=4")
vim.cmd("set shiftwidth=4")
vim.cmd("set expandtab")
vim.cmd("set nowrap")
vim.cmd("set number relativenumber")
vim.cmd("")
vim.g.mapleader = " "
vim.keymap.set('n', '<C-s>', ':w <enter>', {silent = true})
vim.keymap.set('n', '<C-q>', ':q <enter>', {silent = true})

--lsp config

--vim.keymap.set('n', '<c-[>', BufferMovePrevious, {})
vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)

vim.keymap.set('n', '<leader>[', ':BufferPrevious<enter>', {silent = true})
vim.keymap.set('n', '<leader>]', ':BufferNext<enter>', {silent = true})

vim.keymap.set('n', '<F7>', ':ToggleTerm direction=float <enter>', {silent = true})

vim.keymap.set('n', 'A', ':vs <enter>', {silent = true})
vim.keymap.set('n', '<leader>e', ':Neotree filesystem reveal left <enter>', {silent = true})
