return {
	{
		'xiyaowong/transparent.nvim',
		config = function()
			vim.g.transparent_enabled = true
			transparent = require("transparent")
			transparent.setup()
			transparent.toggle(true)
			transparent.clear_prefix('BufferLine')
			transparent.clear_prefix('lualine')
		end,
	},
}
