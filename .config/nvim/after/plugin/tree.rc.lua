require("nvim-tree").setup()
local keymap = vim.keymap
keymap.set('n', '<F2>', ':NvimTreeFindFileToggle<CR>', { silent = true, noremap = true })
keymap.set('n', '<F3>', ':NvimTreeToggle<CR>', { silent = true, noremap = true })
