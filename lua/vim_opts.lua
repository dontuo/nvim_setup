vim.cmd("set tabstop=4")
vim.cmd("set shiftwidth=4")
vim.cmd("set expandtab")
vim.cmd("set nowrap")

vim.g.mapleader = " "
vim.keymap.set('n', '<C-s>', ':w <enter>', {})
vim.keymap.set('n', '<C-q>', ':q <enter>', {})


--lsp config
vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
