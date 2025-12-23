return {
	{
		'nvim-treesitter/nvim-treesitter',
		build = ':TSUpdate',
		config = function()
			require('nvim-treesitter.configs').setup({
				highlight = {
					enable = true,
					disable = {},
				},
				indent = {
					enable = true,
					disable = {},
				},
				ensure_installed = {
					"tsx",
					"toml",
					"fish",
					"json",
					"yaml",
					"toml",
					"python",
					"rust",
					"go",
					"css",
					"html",
					"lua"
				},
				autotag = {
					enable = true,
					enable_close_on_slash = false
				},
			})
		end,
	}
}
