set nocompatible
runtime macros/matchit.vim
filetype off

syntax enable
filetype plugin indent on
colorscheme darkblood

set title

set exrc
set secure
set viminfo+=!

" Fix keys
if &term =~ "rxvt"
  exec "set <kPageUp>=\<ESC>[5^"
  exec "set <kPageDown>=\<ESC>[6^"
endif

augroup cline
  au!
  au WinLeave * set nocursorline
  au WinEnter * set cursorline

  au InsertEnter * set nocursorline
  au InsertLeave * set cursorline

  au VimEnter * set cursorline
augroup END

autocmd VimResized * :wincmd =

set shell=zsh
set mouse=
set directory=~/.vim/tmp/swap
" set backupdir=~/.vim/tmp/backup

" Set undo history
set undofile
set undolevels=1000
set undoreload=10000
set undodir=~/.vim/tmp/undo
set nobackup

" Highlight line
set invcul
set invcursorcolumn
set colorcolumn=80

" Miscs
set noerrorbells
set novisualbell
set emoji
set magic
set hidden
set shortmess=c
set completeopt=noinsert,menuone,noselect
set updatetime=300

" Ignore files
set wildignore+=*.o,*.obj,.git,*.a,*.so,*.lo,*.class,*.beam,deps/*,*.hi,vendor/*,copycat/*,target/*,_build/*

let mapleader=";"
set notimeout
set ttimeout
set ttimeoutlen=10
set ttyfast
set lazyredraw
set synmaxcol=800
set clipboard=unnamedplus
set nonu
set rnu

set fileencodings=utf-8,latin1
set encoding=utf-8
set termencoding=utf-8
set guifont=Terminus\ 8

set helplang=en
set history=1000
set hlsearch
set incsearch
set sidescroll=1
set scrolloff=3

" Indentation
set autoindent
set smartindent
set preserveindent
"set smarttab
"set smartcase
"set ignorecase
set shiftwidth=2
set softtabstop=2
"set ts=2
set expandtab
set modeline
set tildeop
set cpoptions+=$
set breakindent
set backspace=2
set textwidth=72
set nowrap

" Wild mode
set wildmode=longest:full
set wildmenu
set signcolumn=yes

" Rust syntax
let g:rust_recommended_style = 1

" delimitMate
let g:delimitMate_no_esc_mapping = 1

" startify
let g:startify_skiplist = [
      \ 'COMMIT_EDITMSG',
      \ $VIMRUNTIME .'/doc',
      \ 'bundle/.*/doc' ,
      \ 'vimpager'
      \ ]

" vimpager
let vimpager_disable_x11 = 1

if exists("vimpager")
  set statusline=\
  set fillchars=stl:\ ,stlnc:\ ,vert:\ ,fold:\
  set listchars=tab:\ \ ,trail:\ ,extends:\ ,precedes:\
  set list
  set laststatus=0
  set norelativenumber
  set nonumber
endif

" these seem to make new lines (o) slow
set foldmethod=syntax
set nofoldenable
set foldlevel=99
