let mapleader=","

syntax on
set noswapfile
set ignorecase
set incsearch
set ai
set number
set tabstop=4
set shiftwidth=4
set background=dark

call plug#begin()
Plug 'morhetz/gruvbox'
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'mhinz/vim-startify'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
call plug#end()
