vim.cmd('autocmd!')

-- disable netrw
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- incremental live completion
vim.o.inccommand = 'nosplit'
vim.o.wrap = false

-- highlight on search
vim.o.hlsearch = true

-- line numbers relative
vim.wo.number = true
vim.o.relativenumber = true

-- cursorline highlight
vim.o.cursorline = true

-- undo history
vim.opt.undofile = true

-- smart incasesensitive search unless captail letter in search
vim.o.ignorecase = true
vim.o.smartcase = true

-- lower updatetime
vim.o.updatetime = 250

-- show sign column
vim.wo.signcolumn = 'yes'

-- colors
vim.o.termguicolors = true

-- -- shell
-- vim.o.title = true
-- vim.o.shell = 'fish'
--
-- indent
vim.o.breakindent = true
vim.o.autoindent = true
vim.o.smartindent = true
vim.o.smarttab = true
vim.o.shiftwidth = 2
vim.o.tabstop = 2
vim.o.expandtab = true

-- line width 100
vim.o.textwidth = 100

-- cmd/status line
vim.o.showcmd = true
vim.o.cmdheight = 1
vim.o.laststatus = 2


-- misc
vim.o.hidden = true
vim.o.swapfile = false
vim.o.mouse = 'a'
vim.g.mapleader = ','
vim.o.clipboard = 'unnamedplus'
