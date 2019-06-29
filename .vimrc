set nocompatible
syntax on
set number
set ruler

set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set backspace=indent,eol,start

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
call plug#end()

