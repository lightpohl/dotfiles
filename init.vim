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

let $FZF_DEFAULT_COMMAND = 'ag -g ""'

let g:delimitMate_expand_cr = 2

let g:lightline = {
  \ 'colorscheme': 'dracula',
  \ }

call plug#begin('~/.local/share/nvim/plugged')
Plug 'dracula/vim', {'as': 'dracula'}
Plug 'scrooloose/nerdtree', {'on': 'NERDTreeToggle'}
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'itchyny/lightline.vim'
Plug 'junegunn/fzf', {'dir': '~/.fzf', 'do': './install -all'}
Plug 'junegunn/fzf.vim'
Plug 'editorconfig/editorconfig-vim'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'Raimondi/delimitMate'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
call plug#end()

" coc extension:
" - coc-json
" - coc-tsserver
" - coc-html
" - coc-css
" - coc-git
" - coc-eslint
" - coc-prettier

colorscheme dracula

nnoremap ,o :NERDTreeToggle<CR>
nnoremap ,p :FZF<CR>
nnoremap ,f :Prettier<CR>

command! -nargs=0 Prettier :CocCommand prettier.formatFile

autocmd BufRead,BufNewFile *.tsx set filetype=typescript.tsx
autocmd BufRead,BufNewFile *.jsx set filetype=javascript.jsx

