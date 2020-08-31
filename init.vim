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
set signcolumn=yes
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
set mouse=a
set termguicolors
set grepprg=ag\ --nogroup\ --nocolor

let mapleader = ","

let $FZF_DEFAULT_COMMAND = 'ag -g ""'

let g:side_search_prg = "ag"
  \. " --smart-case"
  \. " --heading --stats -C 2 --group"

let g:side_search_splitter = 'vnew'
let g:side_search_split_pct = 0.3

let g:dev_db = 'postgresql://postgres:postgres@localhost:2345/postgres'
let g:test_db = 'postgresql://postgres:postgres@0.0.0.0:8899/postgres'
let g:current_db = g:dev_db

function! CocCurrentFunction()
      return get(b:, 'coc_current_function', '')
endfunction

let g:lightline = {
      \ 'colorscheme': 'dracula',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             ['fugitive', 'cocstatus', 'currentfunction', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'fugitive': 'FugitiveStatusline',
      \   'cocstatus': 'coc#status',
      \   'currentfunction': 'CocCurrentFunction'
      \ },
\ }

let g:coc_global_extensions = [
      \ 'coc-pairs',
      \ 'coc-json',
      \ 'coc-tsserver',
      \ 'coc-html',
      \ 'coc-css',
      \ 'coc-yaml',
      \ 'coc-git',
      \ 'coc-eslint',
      \ 'coc-prettier'
\ ]"

call plug#begin('~/.local/share/nvim/plugged')
    Plug 'pangloss/vim-javascript'
    Plug 'leafgarland/typescript-vim'
    Plug 'maxmellon/vim-jsx-pretty'
    Plug 'dracula/vim'
    Plug 'scrooloose/nerdtree', {'on': 'NERDTreeToggle'}
    Plug 'preservim/nerdcommenter'
    Plug 'itchyny/lightline.vim'
    Plug 'junegunn/fzf', {'dir': '~/.fzf', 'do': './install -all'}
    Plug 'junegunn/fzf.vim'
    Plug 'yegappan/mru'
    Plug 'psliwka/vim-smoothie'
    Plug 'tpope/vim-fugitive'
    Plug 'tpope/vim-surround'
    Plug 'tpope/vim-commentary'
    Plug 'tpope/vim-abolish'
    Plug 'tpope/vim-repeat'
    Plug 'tpope/vim-dadbod'
    Plug 'airblade/vim-gitgutter'
    Plug 'editorconfig/editorconfig-vim'
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
call plug#end()

colorscheme dracula

nnoremap <leader>o :NERDTreeToggle<CR>
nnoremap <leader>p :Files<CR>
nnoremap <leader>r :MRU<CR>
nnoremap <leader>f :Prettier<CR>

nnoremap <leader>gs :G<CR>
nnoremap <leader>gc :Gcommit<CR>

vnoremap <leader>db :DB g:current_db<CR>gv
nnoremap <leader>db :DB g:current_db 

vnoremap <leader>y "+y

nnoremap <C-j> <C-W>j
nnoremap <C-k> <C-W>k
nnoremap <C-l> <C-W>l
nnoremap <C-h> <C-W>h

nnoremap <leader>qf <Plug>(coc-fix-current)

nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

command! -nargs=0 Prettier :CocCommand prettier.formatFile
command! -complete=file -nargs=+ SS execute 'SideSearch <args>'

autocmd BufRead,BufNewFile *.tsx set filetype=typescript.tsx
autocmd BufRead,BufNewFile *.jsx set filetype=javascript.jsx
