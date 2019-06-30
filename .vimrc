syntax on

set exrc
set secure

set belloff=all

set number
set ruler

set tabstop=8
set softtabstop=2
set shiftwidth=2
set expandtab

set backspace=indent,eol,start

set ignorecase
set smartcase

let g:ale_linters_explicit = 1
let g:ale_fix_on_save = 1

let g:ale_linters = {
\ 'javascript': ['eslint'],
\}
let g:ale_fixers = {
\ 'javascript': ['prettier'],
\ 'css': ['prettier'],
\ 'html': ['prettier'],
\ 'json': ['prettier'],
\ 'scss': ['prettier'],
\ 'graphql': ['prettier'],
\ 'markdown': ['prettier'],
\ 'yaml': ['prettier'],
\}

call plug#begin('~/.vim/plugged')
Plug 'scrooloose/nerdtree', {'on': 'NERDTreeToggle'}
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'elzr/vim-json'
Plug 'leafgarland/typescript-vim'
Plug 'w0rp/ale'
Plug 'airblade/vim-gitgutter'
Plug 'itchyny/lightline.vim'
Plug 'tpope/vim-surround'
Plug 'junegunn/fzf', {'dir': '~/.fzf', 'do': './install -all'}
Plug 'junegunn/fzf.vim'
call plug#end()

noremap ,o :NERDTreeToggle<CR>
noremap ,p :FZF<CR>

