local actions = require("telescope.actions")
local keymap = vim.keymap
require('telescope').setup{
  defaults = {
    mappings = {
      i = {
        ["<C-j>"] = "move_selection_next",
        ["<C-k>"] = "move_selection_previous",
        ["<Tab>"] = actions.toggle_selection + actions.move_selection_better,
        ["<S-Tab>"] = actions.toggle_selection + actions.move_selection_worse,
        ["<S-Tab>"] = actions.toggle_selection + actions.move_selection_worse,
        ["<Esc>"] = actions.close, -- disable normal mode
      },
    }
  },
}

keymap.set('n', '<leader><b>', [[<cmd>lua require('telescope.builtin').buffers()<CR>]], { noremap = true, silent = true })
keymap.set('n', '<leader>e', [[<cmd>lua require('telescope.builtin').find_files({previewer = false})<CR>]], { noremap = true, silent = true })
keymap.set('n', '<leader>sb', [[<cmd>lua require('telescope.builtin').current_buffer_fuzzy_find()<CR>]], { noremap = true, silent = true })
keymap.set('n', '<leader>sw', [[<cmd>lua require('telescope.builtin').grep_string()<CR>]], { noremap = true, silent = true })
keymap.set('n', '<leader>f', [[<cmd>lua require('telescope.builtin').live_grep()<CR>]], { noremap = true, silent = true })
