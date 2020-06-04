syntax on

set belloff=all
set number
set ruler
set laststatus=2
set nowrap
set encoding=utf-8
set tabstop=8
set softtabstop=2
set shiftwidth=2
set expandtab
set cmdheight=2
set updatetime=300
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

map <Space> <Leader>

let $FZF_DEFAULT_COMMAND = 'ag -g ""'

let g:side_search_prg = "ag"
  \. " --smart-case"
  \. " --heading --stats -B 1 -A 4"


let g:side_search_splitter = 'vnew'
let g:side_search_split_pct = 0.3

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
  \ 'coc-snippets',
  \ 'coc-pairs',
  \ 'coc-json',
  \ 'coc-tsserver',
  \ 'coc-html',
  \ 'coc-css',
  \ 'coc-yaml',
  \ 'coc-git',
  \ 'coc-eslint',
  \ 'coc-prettier'
\ ]

call plug#begin('~/.local/share/nvim/plugged')
Plug 'dracula/vim'
Plug 'scrooloose/nerdtree', {'on': 'NERDTreeToggle'}
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'itchyny/lightline.vim'
Plug 'junegunn/fzf', {'dir': '~/.fzf', 'do': './install -all'}
Plug 'junegunn/fzf.vim'
Plug 'ddrscott/vim-side-search'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'airblade/vim-gitgutter'
Plug 'mattn/emmet-vim'
Plug 'editorconfig/editorconfig-vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'sheerun/vim-polyglot'
call plug#end()

colorscheme dracula

nnoremap <leader>o :NERDTreeToggle<CR>
nnoremap <leader>p :FZF<CR>
nnoremap <leader>ss :SideSearch <C-R><C-W><CR> | wincmd p

nnoremap <leader>gs :Gstatus<CR>
nnoremap <leader>gc :Gcommit<CR>

nnoremap <C-j> <C-W>j
nnoremap <C-k> <C-W>k
nnoremap <C-l> <C-W>l
nnoremap <C-h> <C-W>h

nmap <leader>[g <Plug>(coc-diagnostic-prev)
nmap <leader>]g <Plug>(coc-diagnostic-next)

vmap <leader>f <Plug>(coc-format-selected)
nmap <leader>f <Plug>(coc-format-selected)

nmap <leader>qf <Plug>(coc-fix-current)

nmap <leader>gd <Plug>(coc-definition)
nmap <leader>gy <Plug>(coc-type-definition)
nmap <leader>gi <Plug>(coc-implementation)
nmap <leader>gr <Plug>(coc-references)

command! -nargs=0 Prettier :CocCommand prettier.formatFile
command! -complete=file -nargs=+ SS execute 'SideSearch <args>'

autocmd BufRead,BufNewFile *.tsx set filetype=typescript.tsx
autocmd BufRead,BufNewFile *.jsx set filetype=javascript.jsx
