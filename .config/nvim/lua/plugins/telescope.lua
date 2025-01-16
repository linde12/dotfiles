return {
	{
		'nvim-telescope/telescope.nvim',
		tag = '0.1.8',
		dependencies = { 'nvim-lua/plenary.nvim' },
		config = function()
			local actions = require('telescope.actions')
			local builtin = require('telescope.builtin')
			local keymap = vim.keymap
			require('telescope').setup({
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
			})

			keymap.set('n', '<leader><b>', builtin.buffers, { desc = 'Telescope buffers' })
			keymap.set('n', '<leader>e', builtin.find_files, { desc = 'Telescope find files' })
			keymap.set('n', '<leader>sb', builtin.current_buffer_fuzzy_find)
			keymap.set('n', '<leader>sw', builtin.grep_string, { desc = 'Telescope grep string' })
			keymap.set('n', '<leader>f', builtin.live_grep, { desc = 'Telescope live grep' })
		end,
	}
}
