return {
	{
		'catppuccin/nvim',
		name = 'catppuccin',
		priority = 1000,
		config = function()
			require('catppuccin').setup({
				transparent_background = true,
				integrations = {
					treesitter = true,
					gitsigns = true,
					mini = true,
					coc_nvim = true,
				},
			})
			vim.cmd.colorscheme 'catppuccin'
		end,
	}
}
