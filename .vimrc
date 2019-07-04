syntax on

set exrc
set secure

set belloff=all

set number
set ruler
set laststatus=2

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

let $FZF_DEFAULT_COMMAND = 'ag -g ""'

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
Plug 'scrooloose/nerdtree', {'on': 'NERDTreeToggle'}
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'elzr/vim-json'
Plug 'leafgarland/typescript-vim'
Plug 'jparise/vim-graphql'
Plug 'cakebaker/scss-syntax.vim'
Plug 'w0rp/ale'
Plug 'airblade/vim-gitgutter'
Plug 'itchyny/lightline.vim'
Plug 'tpope/vim-surround'
Plug 'junegunn/fzf', {'dir': '~/.fzf', 'do': './install -all'}
Plug 'junegunn/fzf.vim'
Plug 'ajh17/VimCompletesMe'
Plug 'editorconfig/editorconfig-vim'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
call plug#end()

nnoremap ,o :NERDTreeToggle<CR>
nnoremap ,p :FZF<CR>

