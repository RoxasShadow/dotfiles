set nocompatible
runtime macros/matchit.vim
filetype off

call plug#begin('~/.vim/plugged')

" Plugs
Plug 'https://github.com/adelarsq/vim-matchit'
Plug 'dstein64/vim-startuptime'
Plug 'mhinz/vim-startify'
Plug 'danchoi/ri.vim'
Plug 'tpope/vim-surround' " e.g. ys$
Plug 'tpope/vim-commentary'
Plug 'mileszs/ack.vim'
Plug 'ciaranm/detectindent'
Plug 'vim-scripts/DrawIt'
Plug 'junegunn/vim-easy-align'
Plug 'tpope/vim-fugitive'
Plug 'jamessan/vim-gnupg'
Plug 'simnalamburt/vim-mundo'
Plug 'paradigm/vim-multicursor'
Plug 'preservim/nerdtree'
Plug 'dbakker/vim-projectroot'
Plug 'tpope/vim-repeat'
Plug 'mhinz/vim-signify'
Plug 'scrooloose/syntastic'
Plug 'majutsushi/tagbar'
Plug 'tpope/vim-unimpaired'
Plug 'Shougo/unite.vim'
Plug 'tpope/vim-eunuch'
Plug 'mattn/webapi-vim'
Plug 'mattn/gist-vim'
Plug 'skwp/vim-spec-finder'
Plug 'simeji/winresizer'
Plug 'zefei/vim-wintabs'
Plug 'zefei/vim-wintabs-powerline'
Plug 'janko/vim-test'
Plug 'Konfekt/FastFold'

" Syntax
Plug 'raymond-w-ko/vim-niji'
Plug 'vim-scripts/Cpp11-Syntax-Support'
Plug 'hail2u/vim-css3-syntax'
Plug 'jimenezrick/vimerl'
Plug 'tpope/vim-haml'
Plug 'vim-scripts/haskell.vim'
Plug 'pangloss/vim-javascript'
Plug 'vim-scripts/JSON.vim'
Plug 'groenewege/vim-less'
Plug 'tpope/vim-markdown'
Plug 'juvenn/mustache.vim'
Plug 'programble/ooc.vim'
Plug 'petdance/vim-perl'
Plug 'uarun/vim-protobuf'
Plug 'vim-scripts/rfc-syntax'
Plug 'vim-ruby/vim-ruby'
Plug 'rust-lang/rust.vim'
Plug 'cespare/vim-toml'
Plug 'bumaociyuan/vim-swift'

Plug 'neoclide/coc.nvim', {'branch': 'master', 'do': 'yarn install --frozen-lockfile'}
let g:coc_global_extensions = ['coc-solargraph']

if exists("*nvim_create_namespace")
"  Plug 'APZelos/blamer.nvim'
endif

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

call plug#end()

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

nnoremap <F2> :set invpaste paste?<CR>
set pastetoggle=<F2>

nnoremap <F3> :set invcul cul?<CR>
imap <F3> <C-o>:set invcul cul?<CR>

nnoremap <F4> :set invcursorcolumn cursorcolumn?<CR>
imap <F4> <C-o>:set invcursorcolumn cursorcolumn?<CR>

nnoremap <F5> :call ColorColumnToggle()<CR>
imap <F5> <C-o>:call ColorColumnToggle()<CR>

map <F10> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
\ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
\ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>

nnoremap <C-c> :redraw!<CR>
imap <C-c> <C-o>:redraw!<CR>

function! ColorColumnToggle()
	if &colorcolumn
		set colorcolumn=
	else
		set colorcolumn=80
	endif
endfunction

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
set undodir=~/.vim/tmp/undo
set nobackup
set undofile
set undolevels=1000
set undoreload=10000
set noerrorbells
set novisualbell
set emoji
set magic
set hidden
set shortmess=atI
set wildignore+=*.o,*.obj,.git,*.a,*.so,*.lo,deps/,vendor/*,target/*
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
set nowrap

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
set backspace=2
set textwidth=72

set wildmode=longest:full
set wildmenu

"if exists("*nvim_create_namespace")
"  let g:blamer_enabled = 0
"  ":call BlamerToggle
"  let g:blamer_delay = 500
"endif

" Status line
source ~/.config/nvim/status_line.vim

map <silent> <PageUp> 1000<C-U>
map <silent> <PageDown> 1000<C-D>
imap <silent> <PageUp> <C-O>1000<C-U>
imap <silent> <PageDown> <C-O>1000<C-D>

" Disable arrows
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>
inoremap <Up> <Nop>
inoremap <Down> <Nop>
inoremap <Left> <Nop>
inoremap <Right> <Nop>

" Tabs
map <silent> <C-T> :tabnew<CR>
map <silent> <C-W> :tabclose<CR>
map <silent> <S-H> :tabprevious<CR>
map <silent> <S-L> :tabnext<CR>

" Windows
nnoremap <silent> <C-h> :wincmd h<CR>
nnoremap <silent> <C-k> :wincmd k<CR>
nnoremap <silent> <C-l> :wincmd l<CR>
nnoremap <silent> <C-j> :wincmd j<CR>

" Other mappings
nmap <Leader>s :mksession! .vim.session<CR>
nmap <Leader>n :nohlsearch<CR>

nmap <Leader>N :NERDTreeToggle<CR>
nmap <Leader>T :TagbarToggle<CR>
nmap <Leader>U :MundoToggle<CR>
nmap <Leader>S :SyntasticCheck<CR>

vnoremap <silent> <Enter> :EasyAlign<CR>

" Rust syntax
let g:rust_recommended_style = 1

" delimitMate
let g:delimitMate_no_esc_mapping = 1

" NERDTree
let NERDTreeIgnore=['\.so$', '\.o$', '\.la$', '\.a$', '\.class$', '\~$', '\.beam$', '^Mnesia.', 'deps/', '\.hi$', 'vendor/', 'target/']

" Open tagbar automatically
autocmd VimEnter * TagbarToggle

" Syntastic
let g:syntastic_enable_signs         = 1
let g:syntastic_error_symbol         = '!!'
let g:syntastic_style_error_symbol   = '!¡'
let g:syntastic_warning_symbol       = '??'
let g:syntastic_style_warning_symbol = '?¿'

let c_no_curly_error = 1

let g:syntastic_c_checker          = "clang"
let g:syntastic_c_compiler_options = "-std=c11"

let g:syntastic_cpp_checker          = "clang"
let g:syntastic_cpp_compiler_options = "-std=c++11"

let g:syntastic_mode_map = { 'mode': 'active',
                           \ 'passive_filetypes': ['javascript'] }

" Signify
let g:signify_sign_overwrite = 1

" Rainbows
let g:niji_darkblood_colours = [
	\ ['255', '255'],
	\ ['253', '253'],
	\ ['251', '251'],
	\ ['249', '249'],
	\ ['247', '247'],
	\ ['245', '245'],
	\ ['243', '243'],
	\ ['241', '241'],
	\ ['239', '239'],
	\ ['237', '237'],
	\ ['235', '235'],
	\]

" Clojure
let g:clojure_align_multiline_strings = 1
let g:clojure_fuzzy_indent            = 1
let g:clojure_fuzzy_indent_patterns   = "with.*,def.*,let.*,case.*"

" ri
nnoremap <Leader>ri :call ri#OpenSearchPrompt(0)<CR>
nnoremap <Leader>RI :call ri#OpenSearchPrompt(1)<CR>
nnoremap <Leader>RK :call ri#LookupNameUnderCursor()<CR>

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

" gist
let g:gist_detect_filetype = 1
let g:gist_open_browser_after_post = 1
let g:gist_browser_command = 'echo %URL% | xclip'

" sprunge
command! -range=% Share silent <line1>,<line2>write !curl -s -F "sprunge=<-" http://sprunge.us | head -n 1 | tr -d '\r\n ' | DISPLAY=:0.0 pbcopy
command! Amend Git add .  | Git commit --amend

func! DeleteTrailingWS()
  exe "normal mz"
  %s/\s\+$//ge
  exe "normal `z"
endfunc

autocmd BufWrite * :call DeleteTrailingWS()

" Resize (also Ctrl+t)
nnoremap <silent> <Leader>+ :exe "resize " . (winheight(0) * 3/2)<CR>
nnoremap <silent> <Leader>- :exe "resize " . (winheight(0) * 2/3)<CR>
nnoremap <silent> <Leader>> :vertical res -3<<CR>
nnoremap <silent> <Leader>< :vertical res +3<<CR>
let g:winresizer_start_key = '<C-T>'

" Test
let test#strategy = "neovim"
let g:test#preserve_screen = 1
let test#neovim#term_position = "botright 20"
let test#ruby#use_spring_binstub = 1

" Press Ctrl-o to exit the test terminal
tmap <C-o> <C-\><C-n>
map <Leader>h <Plug>(wintabs_previous)
map <Leader>l <Plug>(wintabs_next)
map <Leader>d <Plug>(wintabs_close)

" Fold current block in normal mode with F9
inoremap <F9> <C-O>za
nnoremap <F9> za
onoremap <F9> <C-C>za
vnoremap <F9> zf

" these seem to make new lines (o) slow
set foldmethod=syntax
set nofoldenable
set foldlevel=99

" fastfold
nmap zuz <Plug>(FastFoldUpdate)
let g:fastfold_savehook = 1
let g:fastfold_fold_command_suffixes =  ['x','X','a','A','o','O','c','C']
let g:fastfold_fold_movement_commands = [']z', '[z', 'zj', 'zk']

source ~/.config/nvim/coc.vim

" Open related test file with :RelatedSpecOpen / Ctrl+s
source ~/.config/nvim/spec-finder.vim

" File search with fzf/Ag
nnoremap <c-p> :Files<CR>
