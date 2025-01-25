let mapleader=","

syntax on
set hidden
set nobackup
set nowritebackup
set noswapfile
set ignorecase
set incsearch
set ai
set number
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set background=dark
set rnu

let g:netrw_banner = 0

call plug#begin()
Plug 'morhetz/gruvbox'
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'mhinz/vim-startify'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
call plug#end()

colorscheme gruvbox

"Clear searchhighlight on press "enter"
nnoremap <silent> <cr> :nohlsearch<cr><cr>

" Ctrl + hjkl to move between windows
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nnoremap <C-c> <C-w>c

" Make 'Y' act like 'D' and 'C', yanking the remainder of the line from the
" cursor to the end.
nnoremap Y y$

" Cycle through quickfix list with <leader>c and <leader>C
" `zz` centers the cursor on the screen
nnoremap <silent> <leader>c :cnext<cr>zz
nnoremap <silent> <leader>C :cprevious<cr>zz

" Vertically center the cursor with `zz` while cycling through search results
nnoremap n nzz
nnoremap N Nzz
