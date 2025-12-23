return {
	{
		'echasnovski/mini.nvim',
		version = '*',
		config = function()
			require('mini.basics').setup() -- basic config
			require('mini.splitjoin').setup() -- split or join lines with gS
			require('mini.comment').setup() -- comment with gcc
		end,
	}
}
