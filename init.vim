" Setup:
" - Install zsh
" - Install Oh My Zsh: https://ohmyz.sh/#install
" - Install nvm: https://github.com/nvm-sh/nvm
" - Install vim-plug: https://github.com/junegunn/vim-plug
" - Install ripgrep: https://github.com/BurntSushi/ripgrep
" - Create directory for undodir
" - Add .ripgreprc
" - Add .ignore

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
  let $FZF_DEFAULT_COMMAND = 'rg --files --ignore --no-messages'
endif

let g:netrw_winsize = 30
  
let g:airline_theme='gruvbox'

let g:neoformat_try_node_exe = 1

call plug#begin('~/.local/share/nvim/plugged')
Plug 'morhetz/gruvbox'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'airblade/vim-gitgutter'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'sbdchd/neoformat'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-vinegar'
Plug 'mbbill/undotree'
Plug 'editorconfig/editorconfig-vim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-treesitter/nvim-treesitter-context'
Plug 'windwp/nvim/autopairs'
Plug 'neovim/nvim-lspconfig'
Plug 'williamboman/mason.nvim'
Plug 'williamboman/mason-lspconfig.nvim'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'saadparwaiz1/cmp_luasnip'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-nvim-lua'
Plug 'L3MON4D3/LuaSnip'
Plug 'rafamadriz/friendly-snippets'
Plug 'VonHeikemen/lsp-zero.nvim'
call plug#end()

lua << EOF
  require('nvim-treesitter.configs').setup {
    ensure_installed = {"css", "help", "html", "javascript", "typescript"},
    highlight = {enable = true, additional_vim_regex_highlighting = false}
  }
EOF

lua << EOF
  require('treesitter-context').setup {}
EOF

lua << EOF
  require('nvim-autopairs').setup {}
EOF

lua << EOF
  local lsp = require('lsp-zero')
  lsp.preset('recommended')
  
  lsp.ensure_installed({
    'tsserver',
    'eslint',
    'html',
    'cssls'
  })
  
  lsp.nvim_workspace()
  lsp.setup()
EOF

let mapleader = ','

nnoremap <C-j> <C-W>j
nnoremap <C-k> <C-W>k
nnoremap <C-l> <C-W>l
nnoremap <C-h> <C-W>h

nnoremap <C-d> <C-d>zz
nnoremap <C-u> <C-u>zz

nnoremap <leader>b :Buffers<CR>
nnoremap <leader>f :Neoformat<CR>
nnoremap <leader>p :FZF<CR>
nnoremap <leader>u :UndotreeToggle<CR>

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
  :EslintFixAll
  :Neoformat
endfunction
autocmd BufWritePre *.js,*.jsx,*.ts,*.tsx call FormatJavaScript()

function FormatCSS()
  :Neoformat
endfunction
autocmd BufWritePre *.css call FormatCSS()
