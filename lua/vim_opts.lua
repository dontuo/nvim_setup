vim.cmd("set tabstop=4")
vim.cmd("set shiftwidth=4")
vim.cmd("set expandtab")
vim.cmd("set nowrap")
vim.cmd("set number relativenumber")
vim.cmd("")
vim.g.mapleader = " "
vim.keymap.set('n', '<C-s>', ':silent! w <enter>', {})
vim.keymap.set('n', '<C-q>', ':silent! q <enter>', {})

--lsp config

--vim.keymap.set('n', '<c-[>', BufferMovePrevious, {})
vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)

vim.keymap.set('n', '<c-u>', ':silent! BufferPrevious<enter>', {})
vim.keymap.set('n', '<c-i>', ':silent! BufferNext<enter>', {})

vim.keymap.set('n', '<F7>', ':ToggleTerm direction=float <enter>', {})
