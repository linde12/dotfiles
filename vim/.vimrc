" lazyredraw + noh on escape makes vim go into insert mode
" when editing a file
call plug#begin('~/.vim/plugins')
" Utilities
Plug 'racer-rust/vim-racer', {'for': 'rust'}
Plug 'rust-lang/rust.vim', {'for': 'rust'}
let g:racer_cmd = '/home/linde/.cargo/bin/racer'
let g:rustfmt_autosave = 1
let g:racer_experimental_completer = 1

"Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
"Plug 'roxma/nvim-yarp'
"Plug 'roxma/vim-hug-neovim-rpc'
"Plug 'carlitux/deoplete-ternjs', { 'do': 'npm install -g tern' }
"Plug 'sebastianmarkow/deoplete-rust'
"Plug 'Valloric/YouCompleteMe'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'posva/vim-vue', {'for': 'vue'}
let g:vue_disable_pre_processors=1
Plug 'linde12/AutoComplPop'
"Plug 'fatih/vim-go'
Plug 'tpope/vim-sensible'
Plug 'bling/vim-airline'
Plug 'scrooloose/syntastic'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'ryanoasis/vim-devicons'
Plug 'wincent/ferret'
Plug 'AndrewRadev/splitjoin.vim', {'for': ['javascript','vue']}
Plug 'ervandew/supertab'
Plug 'tpope/vim-surround'
Plug 'Raimondi/delimitMate'
"Plug 'marijnh/tern_for_vim' ", {'for': ['javascript','vue']}
Plug 'terryma/vim-multiple-cursors'
Plug 'ctrlpvim/ctrlp.vim', {'on': 'CtrlPCurWD'}

" Color schemes
Plug 'mhartington/oceanic-next'

" Syntax highlight
"Plug 'digitaltoad/vim-pug', {'for': ['pug', 'jade']}
"Plug 'mxw/vim-jsx', {'for': 'javascript.jsx'}
"Plug 'posva/vim-vue', {'for': 'javascript'}
"Plug 'pangloss/vim-javascript', {'for': 'javascript'}
"Plug 'othree/html5.vim', {'for': 'html'}
call plug#end()

autocmd FileType vue call tern#Enable()
autocmd FileType vue setlocal completeopt-=preview
" For .vue NERDCommenter
let g:ft = ''
function! NERDCommenter_before()
  if &ft == 'vue'
    let g:ft = 'vue'
    let stack = synstack(line('.'), col('.'))
    if len(stack) > 0
      let syn = synIDattr((stack)[0], 'name')
      if len(syn) > 0
        exe 'setf ' . substitute(tolower(syn), '^vue_', '', '')
      endif
    endif
  endif
endfunction
function! NERDCommenter_after()
  if g:ft == 'vue'
    setf vue
    let g:ft = ''
  endif
endfunction

syntax enable
filetype plugin indent on
set autowrite
set guioptions=i
set completeopt+=longest
set hlsearch
set cursorline
set noshowmode
set mouse=a
set updatetime=750
set encoding=utf-8
set nowrap
set relativenumber
set hidden
set novisualbell
set showtabline=2
set nobackup noswapfile
set synmaxcol=120 cc=120
set expandtab tabstop=2 softtabstop=2 shiftwidth=2
set wildignore+=*/.git/*,*/node_modules/*,*/.sass-cache/*
set relativenumber

" Reset leader key to comma
let mapleader=","
let maplocalleader=","

" Color scheme configuration
set t_Co=256
colorscheme OceanicNext

" NERDTree map
map <C-z> :NERDTreeTabsToggle<CR>

" Map vimrc files edition
map <leader>ev :e $MYVIMRC<cr>
map <leader>eg :e $MYGVIMRC<cr>
map <leader>sv :source $MYVIMRC<cr>
map <leader>sg :source $MYGVIMRC<cr>

" Omnicomplete on ctrl-space(Nul)
imap <Nul> <c-x><c-o>
" Tab configuration
nnoremap th :tabprev<CR>
nnoremap tl :tabnext<CR>
nnoremap tn :tabnew<CR>

" Split movement
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
"nnoremap <silent> + :exe "resize " . (winheight(0) * 3/2)<CR>
"nnoremap <silent> - :exe "resize " . (winheight(0) * 2/3)<CR>
"nnoremap <silent> > :exe "vertical resize " . (winwidth(0) * 3/2)<CR>
"nnoremap <silent> < :exe "vertical resize " . (winwidth(0) * 2/3)<CR>
nnoremap <silent> + :exe "resize +5"<CR>
nnoremap <silent> - :exe "resize -5"<CR>
nnoremap <silent> > :exe "vertical resize +5"<CR>
nnoremap <silent> < :exe "vertical resize -5"<CR>

" Airline configuration
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_buffers = 0
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline_theme='oceanicnext'

" Bracket newline indent
let delimitMate_expand_cr = 1
let delimitMate_expand_space = 1
"inoremap {<CR> {<CR>}<Esc>O

" Map to remove search highlight
map <leader><esc> :nohlsearch<cr>

" SuperTab configuration
let g:SuperTabDefaultCompletionType = "<c-n>"
let g:SuperTabClosePreviewOnPopupClose = 1

" CtrlP configuration
map <leader>t :CtrlPCurWD<cr>
let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden -g ""'
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
let g:ctrlp_match_window = 'bottom,order:ttb'
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_prompt_mappings = {
      \ 'AcceptSelection("e")': ['<cr>'],
      \ 'AcceptSelection("t")': ['<c-t>'],
      \ }

" Syntastic configuration
let g:syntastic_enable_balloons = 1
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_loc_list_height = 5
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 1
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_rust_checkers = ['cargo']

" NERDCommenter configuration
map <leader>c :NERDComToggleComment<cr>

" Erase trailing line at the end of file
autocmd BufWritePre *.php,*.py,*.js,*.css,*.txt,*.md,*.rb,*.vue :call <SID>StripEOFLines()
function! <SID>StripEOFLines()
  let _s=@/
  let l = line(".")
  let c = col(".")
  %s/\($\n\s*\)\+\%$//e
  let @/=_s
  call cursor(l, c)
endfunction

" JSX in .js files, which is now standard
let g:jsx_ext_required = 0
"let g:syntastic_javascript_eslint_exe = './node_modules/eslint/bin/eslint.js'

" Don't place cursor after newline in visual mode
set selection=old

" Remove highlight selection
" Map to remove search highlight
" needed so that vim still understands escape sequences
"map <leader><esc> :nohlsearch<cr>
map <esc> <esc>:nohlsearch<cr>
nnoremap <esc>^[ <esc>^[
nnoremap <c-i> =i{

" Tern
let g:tern_show_argument_hints='on_hold'
let g:tern_show_signature_in_pum=1
let tern#is_show_argument_hints_enabled=1
let g:ycm_path_to_python_interpreter = '/usr/bin/python'

" Deoplete tern
let g:tern_request_timeout = 1
let g:tern#filetypes = [
  \ 'jsx',
  \ 'javascript.jsx',
  \ 'vue'
  \ ]

let g:splitjoin_trailing_comma = 1
let b:splitjoin_trailing_comma = 1

" Dev icons spacing
"set ambiwidth=double
"autocmd FileType nerdtree setlocal nolist
"let g:WebDevIconsNerdTreeAfterGlyphPadding = '    '


" Golang
" use goimports for formatting
let g:go_fmt_command = "goimports"

" Rust
let g:deoplete#sources#rust#rust_source_path='/home/linde/rust/rust/src'
let g:deoplete#sources#rust#racer_binary='/home/linde/.cargo/bin/racer'
augroup rust-mapping
autocmd!
autocmd filetype rust nmap <buffer> gd <Plug>DeopleteRustGoToDefinitionTab
augroup end

" turn highlighting on
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1

let g:syntastic_go_checkers = ['go', 'golint', 'errcheck']

" jump between errors
map <C-n> :cnext<CR>
map <C-m> :cprevious<CR>

" build and run
autocmd FileType go nmap <leader>b  <Plug>(go-build)
autocmd FileType go nmap <leader>r  <Plug>(go-run)

" show signature
let g:go_auto_type_info = 1
let g:go_auto_sameids = 1

" Open go doc in vertical window, horizontal, or tab
au Filetype go nnoremap <leader>d :tab split <CR>:exe "GoDef"<CR>

let g:deoplete#enable_at_startup = 1
set completeopt+=noinsert
