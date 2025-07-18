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
vim.keymap.set('n', '<C-`>', ':TermExec cmd="sh buildrun.sh" direction=horizontal<enter>', {silent = true}) 

vim.keymap.set('n', '<leader>n', ':vs <enter>', {silent = true})
vim.keymap.set('n', '<leader>h', ':split <enter>', {silent = true})

vim.keymap.set('n', '<leader>e', ':Neotree filesystem reveal left <enter>', {silent = true})


vim.keymap.set('n', '<leader>t', vim.lsp.buf.hover, {})
vim.keymap.set('n', '<leader>;', vim.lsp.buf.definition, {})
vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, {})

vim.keymap.set('n', '<C-0>', ":Telescope project <enter>", {silent = true})

--vim.keymap.set('n', '<C-c>', '"+y<enter>', {silent = true})

--copy from clipboard
vim.api.nvim_set_keymap('n', '<C-c>', '"+y', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '<C-c>', '"+y', { noremap = true, silent = true })

-- Paste from system clipboard
vim.api.nvim_set_keymap('n', '<C-v>', '"+p', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', '<C-v>', '<C-r>+', { noremap = true, silent = true })
vim.api.nvim_set_keymap('c', '<C-v>', '<C-r>+', { noremap = true, silent = true })

-- Insert original character without triggering auto-pairs
vim.api.nvim_set_keymap('i', '<C-r>', '<C-v>', { noremap = true, silent = true })

vim.api.nvim_create_autocmd({ "BufReadPost" }, {
    pattern = { "*" },
    callback = function()
        vim.api.nvim_exec('silent! normal! g`"zv', false)
    end,
})
--vim.o.background = 'dark'
-- Set the colorscheme to PaperColor
vim.cmd("set termguicolors")
vim.cmd('colorscheme PaperColor')

vim.keymap.set('i', '<C-a>', function() require('lsp_signature').toggle_float_win() end, { silent = false, noremap = true, desc = 'toggle signature' })


if vim.g.neovide then
	local alpha = function()
  		return string.format("%x", math.floor(255 * vim.g.transparency or 0.8))
	end
-- g:neovide_transparency should be 0 if you want to unify transparency of content and title bar.
    vim.g.neovide_scale_factor = 0.7

    vim.keymap.set('n', '<leader>-', function() vim.g.neovide_scale_factor = vim.g.neovide_scale_factor - 0.1 end, {silent = true})
    vim.keymap.set('n', '<leader>=', function() vim.g.neovide_scale_factor = vim.g.neovide_scale_factor + 0.1 end, {silent = true})
    vim.g.neovide_window_blurred = true
	vim.g.neovide_opacity = 0.8
	vim.g.transparency = 0.2
    vim.g.neovide_background_color = "#FFFFFF" .. alpha()
    vim.g.neovide_cursor_vfx_mode = "railgun"
    vim.g.neovide_hide_mouse_when_typing = 1
end

local diagnostics_active = true

function ToggleDiagnostics()
  diagnostics_active = not diagnostics_active
  if diagnostics_active then
    vim.diagnostic.enable()
    print("Diagnostics: ON")
  else
    vim.diagnostic.disable()
    print("Diagnostics: OFF")
  end
end

vim.keymap.set('n', '<leader>\\', ToggleDiagnostics, { noremap = true, silent = true })

