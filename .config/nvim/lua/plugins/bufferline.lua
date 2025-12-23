return {
	{
		'akinsho/bufferline.nvim',
		version = "*",
		dependencies = 'nvim-tree/nvim-web-devicons',
		config = function()
			require('bufferline').setup()
			vim.keymap.set('n', '<leader>c', '<cmd>bd<CR>')
			vim.keymap.set('n', '<leader>q', '<cmd>bp<CR>')
			vim.keymap.set('n', '<leader>w', '<cmd>bn<CR>')
		end,
	}
}
