call plug#begin(expand('~/.vim/plugged'))
Plug 'scrooloose/nerdtree'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'airblade/vim-gitgutter'
Plug 'jiangmiao/auto-pairs'
Plug 'Yggdroot/indentLine' " display indentation lines
Plug 'ervandew/supertab' " tab instead of C-n etc.
Plug 'ap/vim-buftabline'
Plug 'neoclide/coc.nvim', { 'branch': 'release' }
Plug 'editorconfig/editorconfig-vim'
Plug 'AndrewRadev/tagalong.vim' " cw in html tags
Plug 'alvan/vim-closetag' " automatically close html tags
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } } " fuzzy finder bin
Plug 'junegunn/fzf.vim' " fuzzy finder vim plugin
Plug 'tpope/vim-sensible' " sensible defaults
Plug 'tpope/vim-fugitive' " git integration
Plug 'itchyny/lightline.vim'
Plug 'joshdick/onedark.vim' " colorscheme
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'} " syntax highlight & indent
call plug#end()

"" sane defaults
set hidden " enable hidden buffers
set ttyfast
set cursorline
set nowrap
set updatetime=100 " for CursorHold event

" tabs/spaces
set tabstop=2
set shiftwidth=2
set softtabstop=0
set expandtab
set fileformats=unix,dos,mac
set shell=$SHELL
set relativenumber


set nobackup
set noswapfile

" search
set hlsearch
set ignorecase
set smartcase
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.pyc,*.db,*.sqlitem,.git

" colorscheme
set background=dark
colorscheme onedark
let g:lightline = {
  \ 'colorscheme': 'wombat',
  \ 'active': {
  \   'left': [ [ 'mode', 'paste' ], [ 'readonly', 'absolutepath', 'modified' ] ],
  \ }
\ }

" disable blinking cursor
set gcr=a:blinkon0


"" misc

" leader bind
let mapleader=','
" fzf.vim use ripgrep
let $FZF_DEFAULT_COMMAND = 'rg --files --hidden --follow --glob "!.git/*" --glob "!node_modules/*"'
" enable treesitter syntax highlight
lua <<EOF
require'nvim-treesitter.configs'.setup { highlight = { enable = true }, indentation = { enable = true } }
EOF

" closetag files
let g:closetag_filenames = "*.vue,*.html,*.jsx.,*.tsx,*.xml"

function s:setupWrapping() " linewrap for txt & md files
  set wrap
  set wm=2
  set textwidth=79
endfunction

function! IsWSL()
  if has("unix")
    let lines = readfile("/proc/version")
    if lines[0] =~ "microsoft"
      return 1
    endif
  endif
  return 0
endfunction

"" autocmd rules
augroup qf
    autocmd!
    autocmd FileType qf set nobuflisted " exclude quickfix list from bprev, bnext
augroup END

augroup vimrc-sync-fromstart
  autocmd!
  autocmd BufEnter * :syntax sync maxlines=400
augroup END

augroup vimrc-remember-cursor-position
  autocmd!
  autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
augroup END

augroup vimrc-wrapping " line wrapping for .md & .txt
  autocmd!
  autocmd BufRead,BufNewFile *.txt,*.md call s:setupWrapping()
augroup END

augroup coc-cmd
  autocmd!
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
  " coc highlight symbol under cursor on CursorHold
  autocmd CursorHold,CursorHoldI * silent call CocActionAsync('highlight')
augroup end

augroup trailing-spaces
  autocmd!
  " remove traling whitespaces on save
  autocmd BufWritePre * :%s/\s\+$//e
augroup END

"" remaps

" :cn, :cp (quickfix next prev)
noremap <Tab> :cn<CR>
noremap <S-Tab> :cp<CR>
" autopairs back insert Alt-A
let g:AutoPairsShortcutBackInsert = '<M-a>'
imap <C-a> <M-a>

" true happiness cannot be accomplished without these
cnoreabbrev W! w!
cnoreabbrev Q! q!
cnoreabbrev Qall! qall!
cnoreabbrev Wq wq
cnoreabbrev Wa wa
cnoreabbrev wQ wq
cnoreabbrev WQ wq
cnoreabbrev W w
cnoreabbrev Q q
cnoreabbrev Qall qall

" fzf ripgrep
function! RipgrepFzf(query)
  let command_fmt = 'rg --column --line-number --no-heading --color=always --smart-case --glob "!.git/*" --glob "!node_modules/*" -- %s || true'
  let initial_command = printf(command_fmt, '.')
  let spec = {'options': ['--query', a:query, '--delimiter=:', '--nth=3..', '--no-info']}
  call fzf#vim#grep(initial_command, 1, fzf#vim#with_preview(spec, 'up'), 0)
endfunction

command! -nargs=* -bang FRG call RipgrepFzf(<q-args>)
nnoremap <silent> <leader>f :call RipgrepFzf(expand('<cword>'))<CR>

function! s:build_quickfix_list(lines)
  call setqflist(map(copy(a:lines), '{ "filename": v:val }'))
  copen
  cc
endfunction

let g:fzf_action = {
  \ 'ctrl-q': function('s:build_quickfix_list'),
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }

let $FZF_DEFAULT_OPTS = '--bind ctrl-a:select-all'

" splits
noremap <Leader>h :<C-u>split<CR>
noremap <Leader>v :<C-u>vsplit<CR>

" set cwd
nnoremap <leader>. :lcd %:p:h<CR>
nnoremap <leader>.. :lcd ..<CR>

" buffer management
nnoremap <silent> <leader>b :Buffers<CR>
nnoremap <silent> <leader>e :FZF -m<CR>
noremap <leader>c :bd<CR>
noremap <leader>q :bp<CR>
noremap <leader>w :bn<CR>

" copy-paste
noremap YY "+y<CR>
noremap <leader>p "+gP<CR>
noremap XX "+x<CR>

" git log & blame (for those "that couldn't have been me" moments)
noremap <leader>gb :Gblame<CR>
noremap <leader>l :Commits<CR>

" clear search highlight
nnoremap <silent> <leader><space> :noh<cr>

" window nav
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l
noremap <C-h> <C-w>h

" visual mode after shift with < or >
vmap < <gv
vmap > >gv

" move visual blocks with SHIFT J and K
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

" search mappings: these will make it so that going to the next one in a
" search will center on the line it's found in
nnoremap n nzzzv
nnoremap N Nzzzv

" supertab mappings
let g:SuperTabDefaultCompletionType = "<c-n>"
let g:SuperTabCrMapping = 1

" nerdtree
nnoremap <silent> <F2> :NERDTreeFind<CR>
nnoremap <silent> <F3> :NERDTreeToggle<CR>

" coc refresh
inoremap <silent><expr> <c-space> coc#refresh()

" coc gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" coc diagnostics
nmap <silent> [c <Plug>(coc-diagnostic-prev)
nmap <silent> ]c <Plug>(coc-diagnostic-next)

" coc docs
nnoremap <silent> K :call <SID>show_documentation()<CR>
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" coc rename current word
nmap <leader>rn <Plug>(coc-rename)
" coc code action current line
nmap <leader>ac  <Plug>(coc-codeaction)
" coc autofix current line
nmap <leader>af  <Plug>(coc-fix-current)

" coc organize imports (:OR)
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" coc command list
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>

" WSL yank support
if IsWSL()
  let s:clip = '/mnt/c/Windows/System32/clip.exe'
  if executable(s:clip)
      augroup WSLYank
          autocmd!
          " yank to windows clipboard only if operator is y
          autocmd TextYankPost * if v:event.operator ==# 'y' | call system(s:clip, @0) | endif
      augroup END
  endif
endif

" buf tabline colors
hi default link BufTabLineCurrent PmenuSel
hi default link BufTabLineModifiedCurrent PmenuSel
hi default link BufTabLineModifiedActive WarningMsg
hi default link BufTabLineModifiedHidden WarningMsg
