local keymap = vim.keymap

-- dont yank into main reg when using x
keymap.set('n', 'x', '"_x')

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

