" Setup:
" - Download iTerm2: https://iterm2.com/
" - Create directory for npm global installs: https://stackoverflow.com/a/55274930
" - Install tpm: https://github.com/tmux-plugins/tpm
" - Install vim-plug: https://github.com/junegunn/vim-plug
" - Install ripgrep: https://github.com/BurntSushi/ripgrep
" - Install diff-so-fancy: https://www.npmjs.com/package/diff-so-fancy
" - Create directory for undodir
" - Add .ripgreprc
" - Add .tmux.conf

let mapleader = ","

if !exists('g:vscode')
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
  set undodir=~/.undodir
  set undofile
  set incsearch
  set shortmess+=c
  set updatetime=300
  set mouse=a
  set termguicolors
  set grepprg=rg\ --vimgrep


  let $FZF_DEFAULT_COMMAND = 'rg --files --no-ignore-vcs --hidden'
  let $BAT_THEME = 'Dracula'

  let g:dracula_colorterm = 0

  let g:lightline = {
        \ 'colorscheme': 'dracula',
        \ 'active': {
        \   'left': [ [ 'mode', 'paste' ],
        \             ['gitbranch', 'readonly', 'filename', 'modified' ] ]
        \ },
        \ 'component_function': {
        \   'gitbranch': 'FugitiveHead',
        \ },
  \ }

  call plug#begin('~/.local/share/nvim/plugged')
      Plug 'dracula/vim'
      Plug 'itchyny/lightline.vim'
      Plug 'junegunn/fzf', {'dir': '~/.fzf', 'do': './install -all'}
      Plug 'junegunn/fzf.vim'
      Plug 'yegappan/mru'
      Plug 'tpope/vim-fugitive'
      Plug 'tpope/vim-surround'
      Plug 'tpope/vim-commentary'
      Plug 'tpope/vim-abolish'
      Plug 'tpope/vim-repeat'
      Plug 'airblade/vim-gitgutter'
      Plug 'christoomey/vim-tmux-navigator'
      Plug 'editorconfig/editorconfig-vim'
  call plug#end()

  colorscheme dracula

  nnoremap <C-j> <C-W>j
  nnoremap <C-k> <C-W>k
  nnoremap <C-l> <C-W>l
  nnoremap <C-h> <C-W>h

  nnoremap <leader>p :Files<CR>
  nnoremap <leader>r :MRU<CR>

  vnoremap <leader>y "+y
  
  autocmd BufRead,BufNewFile *.tsx set filetype=typescript.tsx
  autocmd BufRead,BufNewFile *.jsx set filetype=javascript.jsx
endif
