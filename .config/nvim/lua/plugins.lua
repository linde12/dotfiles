require("lazy").setup({
  { 'echasnovski/mini.splitjoin', branch = 'stable' },
  'nvim-treesitter/nvim-treesitter',
  {
    'nvim-telescope/telescope.nvim', tag = '0.1.0',
    dependencies = { {'nvim-lua/plenary.nvim'} }
  },
  { 'nvim-lualine/lualine.nvim', dependencies = {'kyazdani42/nvim-web-devicons', lazy = true} },
  'windwp/nvim-autopairs',
  'windwp/nvim-ts-autotag',
  'akinsho/nvim-bufferline.lua',
  'lewis6991/gitsigns.nvim',
  'dinhhuy258/git.nvim',
  'tpope/vim-surround',
  'tomtom/tcomment_vim',
  'folke/tokyonight.nvim',
  { 'kyazdani42/nvim-tree.lua', dependencies = { 'kyazdani42/nvim-web-devicons' } },
  {'neoclide/coc.nvim', branch = 'release'},

  {'akinsho/git-conflict.nvim', version = "*", config = true},
  {
    "kdheepak/lazygit.nvim",
    -- optional for floating window border decoration
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
  },

  -- -- LSP
  -- {'VonHeikemen/lsp-zero.nvim', branch = 'v3.x'},
  --
  -- --- Uncomment these if you want to manage LSP servers from neovim
  -- {'williamboman/mason.nvim'},
  -- {'williamboman/mason-lspconfig.nvim'},
  --
  -- -- LSP Support
  -- {
  --   'neovim/nvim-lspconfig',
  --   dependencies = {
  --     {'hrsh7th/cmp-nvim-lsp'},
  --   },
  -- },
  --
  -- -- Autocompletion
  -- {
  --   'hrsh7th/nvim-cmp',
  --   dependencies = {
  --     {'L3MON4D3/LuaSnip'},
  --   }
  -- }
})
