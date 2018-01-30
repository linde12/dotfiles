local status, packer = pcall(require, 'packer')
if (not status) then
  print('Packer is not installed. See https://github.com/wbthomason/packer.nvim')
  return
end

packer.startup(function (use)
  use 'wbthomason/packer.nvim'

  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.0',
    requires = { {'nvim-lua/plenary.nvim'} }
  }

  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }

  use {
    'nvim-lualine/lualine.nvim',
    requires = {'kyazdani42/nvim-web-devicons', opt = true}
  }

  use 'windwp/nvim-autopairs'
  use 'windwp/nvim-ts-autotag'
  use 'norcalli/nvim-colorizer.lua'
  use 'akinsho/nvim-bufferline.lua'
  -- use 'github/copilot.vim'

  use 'lewis6991/gitsigns.nvim'
  use 'dinhhuy258/git.nvim' -- For git blame & browse

  use 'tpope/vim-surround'
  use 'tomtom/tcomment_vim'
  use 'folke/tokyonight.nvim'

  use {
    'kyazdani42/nvim-tree.lua',
    requires = 'kyazdani42/nvim-web-devicons',
    config = function() require'nvim-tree'.setup {} end
  }

  -- coc.nvim auto complete (using this until built-in lsp is _better_)
  use {'neoclide/coc.nvim', branch = 'release'}

  -- Built-in LSP needs lots of plugins and configuration.
  -- Use coc for now.
  -- -- mason lsp
  -- use {
  --   "williamboman/mason.nvim",
  --   "williamboman/mason-lspconfig.nvim",
  --   "neovim/nvim-lspconfig",
  -- }
  --
  -- -- auto complete
  -- use {
  --   "hrsh7th/cmp-nvim-lsp",
  --   "hrsh7th/cmp-buffer",
  --   "hrsh7th/cmp-path",
  --   "hrsh7th/cmp-cmdline",
  --   "hrsh7th/nvim-cmp"
  -- }

  -- -- lspkind
  -- use {
  --   "onsails/lspkind.nvim"
  -- }
end)
