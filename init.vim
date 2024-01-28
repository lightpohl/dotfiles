syntax on

set belloff=all
set number relativenumber
set ruler
set laststatus=2
set nowrap
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
set undodir=~/.config/nvim/undodir
set undofile
set nohlsearch
set incsearch
set shortmess+=c
set updatetime=50
set mouse=a
set termguicolors
set scrolloff=8

if executable('rg')
  set grepprg=rg\ --vimgrep\ --no-heading\ --smart-case
  set grepformat+=%f:%l:%c:%m
endif

let g:netrw_winsize = 30
  
let g:airline_theme='gruvbox'

let g:neoformat_try_node_exe = 1

call plug#begin('~/.local/share/nvim/plugged')
Plug 'morhetz/gruvbox'
Plug 'airblade/vim-gitgutter'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'sbdchd/neoformat'
Plug 'nvim-telescope/telescope.nvim',
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-treesitter/nvim-treesitter-context'
Plug 'windwp/nvim-autopairs'
Plug 'windwp/nvim-ts-autotag'
call plug#end()

let mapleader = ','

nnoremap <C-j> <C-W>j
nnoremap <C-k> <C-W>k
nnoremap <C-l> <C-W>l
nnoremap <C-h> <C-W>h

nnoremap <C-d> <C-d>zz
nnoremap <C-u> <C-u>zz

nnoremap <leader>u :UndotreeToggle<CR>

nnoremap <leader>ff :Telescope find_files<CR>
nnoremap <leader>fg :Telescope live_grep<CR>
nnoremap <leader>fb :Telescope buffers<CR>
nnoremap <leader>fh :Telescope help_tags<CR>

nnoremap Y y$

nnoremap n nzzzv
nnoremap N Nzzzv
nnoremap J mzJ`z

inoremap , ,<c-g>u
inoremap . .<c-g>u
inoremap ! !<c-g>u
inoremap ? ?<c-g>u
inoremap [ [<c-g>u
inoremap { {<c-g>u
inoremap ( (<c-g>u

vnoremap <leader>y "+y

autocmd vimenter * ++nested colorscheme gruvbox

autocmd BufNewFile,BufRead *.js,*.jsx set filetype=javascriptreact
autocmd BufNewFile,BufRead *.ts,*.tsx set filetype=typescriptreact

function FormatJavaScript()
  if exists(':EslitFixAll')
    :EslintFixAll
  endif
  
  if exists(':Neoformat')
    :Neoformat
  endif
endfunction
autocmd BufWritePre *.js,*.jsx,*.ts,*.tsx call FormatJavaScript()

function FormatCSS()
  if exists(':Neoformat')
    :Neoformat
  endif
endfunction
autocmd BufWritePre *.css call FormatCSS()

function FormatSQL()
  if exists(':Neoformat')
    :Neoformat 
  endif
endfunction
autocmd BufWritePre *.sql call FormatSQL()

