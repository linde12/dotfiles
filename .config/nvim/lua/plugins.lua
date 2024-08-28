require("lazy").setup({
  { 'echasnovski/mini.splitjoin', branch = 'stable' },
  'nvim-treesitter/nvim-treesitter',
  {
    'nvim-telescope/telescope.nvim', tag = '0.1.4',
    dependencies = { {'nvim-lua/plenary.nvim'} }
  },
  { 'nvim-lualine/lualine.nvim', dependencies = {'kyazdani42/nvim-web-devicons', lazy = true} },
  {'windwp/nvim-autopairs', event = "InsertEnter", config = true},
  'windwp/nvim-ts-autotag',
  'akinsho/nvim-bufferline.lua',
  'lewis6991/gitsigns.nvim',
  'dinhhuy258/git.nvim',
  'tpope/vim-surround',
  {'numToStr/Comment.nvim', config = true},
  { "catppuccin/nvim", name = "catppuccin", priority = 1000 },
  { 'kyazdani42/nvim-tree.lua', dependencies = { 'kyazdani42/nvim-web-devicons' } },
  'xiyaowong/transparent.nvim',
  {'neoclide/coc.nvim', branch = 'release'},

  {'akinsho/git-conflict.nvim', version = "*", config = true},
  {
    "kdheepak/lazygit.nvim",
    -- optional for floating window border decoration
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
  },

  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    build = "cd app && npm install",
    init = function()
      vim.g.mkdp_filetypes = { "markdown" }
    end,
    ft = { "markdown" },
  },
  { "lukas-reineke/indent-blankline.nvim", main = "ibl", opts = {} },
  { "github/copilot.vim" },
  -- 'OmniSharp/omnisharp-vim'

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
