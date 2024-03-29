if &compatible
  set nocompatible               " Be iMproved
endif

set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*/node_modules/*,*/dist/*

let g:python_host_prog=expand('$PYENV_ROOT/versions/$PYENV2_NAME/bin/python')
let g:python3_host_prog=expand('$PYENV_ROOT/versions/$PYENV3_NAME/bin/python')

"set rtp+=~/.skim

call plug#begin('~/.local/share/nvim/plugged')

Plug 'Shougo/deoplete.nvim'
Plug 'Shougo/denite.nvim'
Plug 'Shougo/neosnippet-snippets'
Plug 'Shougo/neosnippet.vim'
Plug 'neomake/neomake'

" utils
Plug 'junegunn/fzf', { 'build': './install --all', 'merged': 0 }
Plug 'junegunn/fzf.vim', { 'depends': 'fzf' } "fzf
"Plug 'lotabout/skim', { 'dir': '~/.skim', 'do': './install' }
Plug 'w0rp/ale'                       "lint/fix
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-rhubarb'
Plug 'Yggdroot/indentLine'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'eval `fnm env` & cd app & npm install' }
Plug 'voldikss/vim-floaterm'

" code
Plug 'fatih/vim-go'
Plug 'sebdah/vim-delve'
Plug 'rust-lang/rust.vim'
Plug 'hashivim/vim-terraform'
Plug 'juliosueiras/vim-terraform-completion'
Plug 'chr4/nginx.vim'
Plug 'tpope/vim-commentary'
Plug 'editorconfig/editorconfig-vim'
Plug 'mattn/emmet-vim', { 'on_ft': ['javascript', 'javascript.jsx', 'html', 'xml'] }
Plug 'pangloss/vim-javascript'
Plug 'heavenshell/vim-jsdoc'
Plug 'Glench/Vim-Jinja2-Syntax'
Plug 'ekalinin/Dockerfile.vim'
Plug 'neoclide/coc.nvim', {'do': { -> coc#util#install()}}  " intellisense
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
" Plug 'Valloric/MatchTagAlways'
Plug 'cohama/lexima.vim'
Plug 'python-mode/python-mode', { 'branch': 'develop' }
Plug 'Glench/Vim-Jinja2-Syntax'

" format
Plug 'ntpeters/vim-better-whitespace'
Plug 'andymass/vim-matchup'
Plug 'kristijanhusak/vim-carbon-now-sh'

" theme
" Plug 'phanviet/vim-monokai-pro'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" Plug 'jaredgorski/SpaceCamp'
Plug 'mhartington/oceanic-next'
" Plug 'chriskempson/base16-vim'

call plug#end()

set background=dark
colorscheme OceanicNext
"colorscheme spacecamp
filetype plugin indent on
syntax enable
highlight Pmenu guibg=#161616

set termguicolors
" disable mouse
set mouse=r
set encoding=utf8
set hidden
set nomodeline
set secure
set nobackup nowritebackup noswapfile autoread
set hlsearch incsearch ignorecase smartcase
set wildmenu
set backspace=indent,eol,start
set clipboard+=unnamed,unnamedplus
set showcmd
set showmatch
set showmode
set ruler
set number
set nofoldenable
set scrolloff=1
set sidescrolloff=5
set colorcolumn=+1
set formatoptions+=o
set linespace=0
set noerrorbells
set nojoinspaces
set splitbelow
set splitright
set display+=lastline
set updatetime=250
set timeoutlen=500
set shiftwidth=2
set expandtab
set tabstop=2
"set softtabstop=2
set conceallevel=0
set undolevels=100
set nowrap
set undodir=~/.config/nvim/undodir " Maintain undo history between sessions

"ale
let g:ale_linters_explicit=1
let g:ale_fix_on_save=1
let g:ale_linters={
\ 'css': ['prettier'],
\ 'c': ['clangtidy'],
\ 'cpp': ['clangtidy', 'cppcheck'],
\ 'go': ['gopls'],
\ 'graphql': ['prettier'],
\ 'html': ['prettier'],
\ 'javascript': ['eslint', 'prettier'],
\ 'python': ['pylint'],
\ 'json': ['prettier'],
\ 'less': ['prettier'],
\ 'markdown': ['prettier'],
\ 'rust': ['rustfmt'],
\ 'scss': ['prettier'],
\ 'sh': ['language_server'],
\ 'terraform': ['fmt'],
\ 'xml': ['xmllint'],
\ 'yaml': ['prettier'],
\}

let g:ale_fixers={
\ 'css': ['prettier'],
\ 'graphql': ['prettier'],
\ 'html': ['prettier'],
\ 'javascript': ['prettier', 'eslint'],
\ 'json': ['prettier'],
\ 'python': ['generic_python'],
\ 'less': ['prettier'],
\ 'markdown': ['prettier'],
\ 'scss': ['prettier'],
\ 'yaml': ['prettier'],
\}

" floaterm
let g:floaterm_position='center'

" netrw
let g:netrw_liststyle=3
let g:netrw_banner=0
let g:netrw_winsize=15

"fzf
let g:fzf_buffers_jump=1
let g:fzf_history_dir='~/.local/share/fzf-history'
let g:fzf_tags_command='fd | ctags --links=no -L-'

"gitgutter
let g:gitgutter_enabled=0

" whitespace
let g:indentLine_char="•"
let g:indentLine_color_term=239
let g:indentLine_enabled=1

let g:gitgutter_enabled=0
let g:jsx_ext_required=0

" Go
let g:go_fmt_command = "goimports"
let g:go_term_mode="split"
let g:go_list_height=0
let g:go_term_mode="split"
let g:go_term_height=10
let g:go_term_width=10
let g:delve_new_command="enew"
let g:go_autodetect_gopath=1
let g:go_def_mode='gopls'
let g:go_info_mode='gopls'

" Prettier
let g:prettier#config#bracket_spacing='true'
let g:prettier#config#single_quote='true'
let g:prettier#config#trailing_comma='all'
let g:prettier#exec_cmd_async=1

" Rust
let g:rustfmt_autosave=1

let g:sneak#s_next=1
let g:used_javascript_libs='react'
let g:vim_jsx_pretty_colorful_config=1

" Terraform
let g:terraform_align=1
let g:terraform_fmt_on_save=1

" JS
let g:javascript_plugin_jsdoc=1
let g:prettier#config#print_width=80
let g:prettier#config#tab_width=2
let g:prettier#config#use_tabs='false'
let g:prettier#config#bracket_spacing='true'
let g:prettier#config#single_quote='true'
let g:prettier#config#trailing_comma='es5'
let g:prettier#config#jsx_bracket_same_line='true'
let g:prettier#exec_cmd_async=1
let g:jsdoc_return=1
let g:jsdoc_enable_es6=1

" FUNCTIONS
function! s:fzf_statusline()
  " Override statusline as you like
  highlight fzf1 ctermfg=161 ctermbg=251
  highlight fzf2 ctermfg=23 ctermbg=251
  highlight fzf3 ctermfg=237 ctermbg=251
  setlocal statusline=%#fzf1#\ >\ %#fzf2#fz%#fzf3#f
endfunction
au! User FzfStatusLine call <SID>fzf_statusline()

" coc Tab
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

command! -nargs=0 Prettier :call CocAction('runCommand', 'prettier.formatFile')
" Use `:Format` for format current buffer
command! -nargs=0 Format :call CocAction('format')

if executable('./node_modules/.bin/eslint')
  let g:neomake_javascript_eslint_exe='./node_modules/.bin/eslint'
endif
let g:neomake_javascript_eslint_maker={
    \ 'args': ['-f', 'compact'],
    \ 'errorformat': '%E%f: line %l\, col %c\, Error - %m,' .
    \ '%W%f: line %l\, col %c\, Warning - %m'
    \ }
let g:neomake_javascript_enabled_makers=['eslint']
let g:neomake_jsx_eslint_maker={
    \ 'args': ['-f', 'compact'],
    \ 'errorformat': '%E%f: line %l\, col %c\, Error - %m,' .
    \ '%W%f: line %l\, col %c\, Warning - %m'
    \ }
let g:neomake_jsx_enabled_makers=['eslint']
let g:neomake_yaml_enabled_makers=['yamllint']
au! BufWritePost * Neomake

au FileType make setlocal noexpandtab sw=4 ts=4 sts=4

command! -nargs=0 Prettier :call CocAction('runCommand', 'prettier.formatFile')
" Use `:Format` for format current buffer
command! -nargs=0 Format :call CocAction('format')

"CarbonNow
let g:carbon_now_sh_browser = 'google-chrome'

" Auto Resize when window has changed
autocmd VimResized * wincmd =

" Set Leader
let mapleader="\<SPACE>"

noremap <leader>T :FloatermToggle<CR>i

nmap , :Files<CR>
nnoremap <leader>= <C-w>=
noremap <leader>q :q<CR>
noremap <leader>w :w<CR>
noremap <leader>q! :q!<CR>
nnoremap <ESC> :noh<return><ESC>
nnoremap <leader><leader> <c-^>
nnoremap <Tab> :bnext!<CR>
nnoremap <S-Tab> :bprev!<CR><Paste>
nnoremap <bar> <C-w><bar>
xnoremap p pgvy
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)
nmap f <Plug>Sneak_f
nmap F <Plug>Sneak_F
xmap f <Plug>Sneak_f
xmap F <Plug>Sneak_F
omap f <Plug>Sneak_f
omap F <Plug>Sneak_F
nmap <Leader>b :Buffers<CR>
nmap <Leader>f :GFiles<CR>
nmap <Leader>F :Files<CR>
nmap <Leader>t :Tags<CR>
nmap <Leader>m :History<CR>
nmap gs <plug>(GrepperOperator)
xmap gs <plug>(GrepperOperator)
nnoremap <leader>* :Grepper -tool rg -cword -noprompt<cr>
nnoremap <leader>g :Grepper -tool rg<cr>
nnoremap <leader>G :Grepper -tool rg -buffers<cr>
" WINDOWS
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
" if on iterm2, add key pref for CTRL-H in prefs,
" action send escape sequence, type in [104;5u
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l
nnoremap _ <C-w>_

filetype plugin indent on


