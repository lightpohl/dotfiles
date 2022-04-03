" Setup:
" - Use with VSCode Neovim: https://marketplace.visualstudio.com/items?itemName=asvetliakov.vscode-neovim
" - Install zsh
" - Install Oh My Zsh: https://ohmyz.sh/#install
" - Install nvm: https://github.com/nvm-sh/nvm
" - Create directory for npm global installs: https://stackoverflow.com/a/55274930
" - Install diff-so-fancy: https://www.npmjs.com/package/diff-so-fancy
" - Create directory for undodir
" - Add .ignore

let mapleader = ","

syntax on

set belloff=all
set number relativenumber
set ruler
set laststatus=2
set nowrap
set encoding=utf-8
set tabstop=2
set shiftwidth=2
set expandtab
set cmdheight=2
set signcolumn=number
set backspace=indent,eol,start
set ignorecase
set smartcase
set hidden
set noswapfile
set nobackup
set nowritebackup
set undodir=~/.config/nvim/undodir
set undofile
set incsearch
set shortmess+=c
set updatetime=300
set mouse=a
set termguicolors
