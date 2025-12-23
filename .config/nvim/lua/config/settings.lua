local keymap = vim.keymap

-- use system clipboard for yanks
vim.o.clipboard = 'unnamedplus'

-- highlight on search
vim.o.hlsearch = true

-- persist undo history
vim.o.undofile = true

-- smart incase sensitive search
vim.o.ignorecase = true
vim.o.smartcase = true

-- low updatetime
vim.o.updatetime = 250

-- show sign column
vim.wo.signcolumn = 'yes'

-- default line width 100
vim.o.textwidth = 100

-- set relative line numbers
vim.wo.relativenumber = true

-- disable swap
vim.opt.swapfile = false

-- leader ,
vim.g.mapleader = ","
vim.g.maplocalleader = "\\"

-- indentation
vim.o.smartindent = false -- instead, use treesitter for indent
vim.o.autoindent = true
vim.o.expandtab = true
vim.o.tabstop = 4
vim.o.shiftwidth = 4

-- select all
keymap.set('n', '<C-a>', 'gg<S-v>G')

-- splits
keymap.set('n', 'ss', ':split<Return><C-w>w', { silent = true })
keymap.set('n', 'sv', ':vsplit<Return><C-w>w', { silent = true })

-- Quickfix
keymap.set('n', '<Tab>', ':cn<CR>', { noremap = true })
keymap.set('n', '<S-Tab>', ':cp<CR>', { noremap = true })

-- window movement
keymap.set('n', '<C-j>', '<C-w>j')
keymap.set('n', '<C-k>', '<C-w>k')
keymap.set('n', '<C-h>', '<C-w>h')
keymap.set('n', '<C-l>', '<C-w>l')
keymap.set('n', 'n', 'nzzzv')
keymap.set('n', 'N', 'Nzzzv')
keymap.set('n', '<leader><Space>', ':noh<CR>', { silent = true })

-- how to exit vim
vim.cmd [[cnoreabbrev W! w!]]
vim.cmd [[cnoreabbrev Q! q!]]
vim.cmd [[cnoreabbrev Qall! qall!]]
vim.cmd [[cnoreabbrev Wq wq]]
vim.cmd [[cnoreabbrev Wa wa]]
vim.cmd [[cnoreabbrev wQ wq]]
vim.cmd [[cnoreabbrev WQ wq]]
vim.cmd [[cnoreabbrev W w]]
vim.cmd [[cnoreabbrev Q q]]
vim.cmd [[cnoreabbrev Qall qall]]

-- change cwd
keymap.set('n', '<leader>.', ":lcd %:p:h<CR>")
keymap.set('n', '<leader>..', ":lcd ..<CR>")

-- system clipboard yank
keymap.set('n', '<leader>y', '"+y')
keymap.set('n', '<leader>p', '"+p')

-- markdown preview
keymap.set('n', '<leader>m', ':MarkdownPreview<CR>', { silent = true })

-- <leader>p paste fro "0 register (non-volatile)
keymap.set('n', '<leader>p', '"0p')
