vim.cmd [[
augroup vimrc-remember-cursor-position
  autocmd!
  autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
augroup END

augroup vimrc-wrapping " line wrapping for .md & .txt
  autocmd!
  autocmd BufRead,BufNewFile *.txt,*.md set wrap
augroup END
]]
