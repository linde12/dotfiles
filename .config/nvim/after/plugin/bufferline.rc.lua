require("bufferline").setup()
local keymap = vim.keymap
local opts = { noremap = true, silent = true }
keymap.set('n', '<leader>c', '<cmd>bd<CR>', opts)
keymap.set('n', '<leader>q', '<cmd>bp<CR>', opts)
keymap.set('n', '<leader>w', '<cmd>bn<CR>', opts)
