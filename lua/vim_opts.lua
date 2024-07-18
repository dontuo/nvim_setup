vim.cmd("set tabstop=4")
vim.cmd("set shiftwidth=4")
vim.cmd("set expandtab")
vim.cmd("set nowrap")
vim.cmd("set number relativenumber")
vim.cmd("")
vim.g.mapleader = " "
vim.keymap.set('n', '<C-s>', ':w <enter>', {silent = true})
vim.keymap.set('n', '<C-q>', ':q <enter>', {silent = true})
vim.keymap.set('n', '<C-t>', ':TransparentToggle <enter>', {silent = true})

--lsp config

--vim.keymap.set('n', '<c-[>', BufferMovePrevious, {})
vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)

vim.keymap.set('n', '<leader>[', ':BufferPrevious<enter>', {silent = true})
vim.keymap.set('n', '<leader>]', ':BufferNext<enter>', {silent = true})
vim.keymap.set('n', '<leader>q', ':BufferClose<enter>', {silent = true}) 

vim.keymap.set('n', '<F7>', ':ToggleTerm direction=float <enter>', {silent = true})
vim.keymap.set('n', '<F6>', ':ToggleTerm direction=horizontal <enter>', {silent = true})
vim.keymap.set('n', '<C-`>', ':TermExec cmd="sh buildrun.sh" direction=horizontal<enter> go_back=0', {silent = true}) 

vim.keymap.set('n', '<leader>n', ':vs <enter>', {silent = true})
vim.keymap.set('n', '<leader>h', ':split <enter>', {silent = true})

vim.keymap.set('n', '<leader>e', ':Neotree filesystem reveal left <enter>', {silent = true})


vim.keymap.set('n', '<leader>t', vim.lsp.buf.hover, {})
vim.keymap.set('n', '<leader>;', vim.lsp.buf.definition, {})

--vim.o.background = 'dark'
-- Set the colorscheme to PaperColor
vim.cmd("set termguicolors")
vim.cmd('colorscheme PaperColor')
