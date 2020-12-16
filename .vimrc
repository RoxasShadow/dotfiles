" Disable compression shit
" let loaded_gzip        = 1
" let g:loaded_tarPlugin = 1
" let g:loaded_tar       = 1
" let g:loadedZipPlugin  = 1
" let g:loaded_zip       = 1

set nocompatible
runtime macros/matchit.vim
filetype off

call plug#begin('~/.vim/plugged')

" Plugs
Plug 'mileszs/ack.vim'
Plug 'tpope/vim-classpath'
Plug 'tpope/vim-fireplace'
Plug 'git://git.wincent.com/command-t.git'
Plug 'ciaranm/detectindent'
Plug 'vim-scripts/DrawIt'
Plug 'junegunn/vim-easy-align'
Plug 'tpope/vim-fugitive'
Plug 'jamessan/vim-gnupg'
Plug 'sjl/gundo.vim'
"Plug 'hsanson/vim-android'
Plug 'paradigm/vim-multicursor'
Plug 'preservim/nerdcommenter'
Plug 'preservim/nerdtree'
Plug 'dbakker/vim-projectroot'
Plug 'tpope/vim-repeat'
Plug 'mhinz/vim-rfc'
Plug 'mhinz/vim-signify'
Plug 'tpope/vim-surround'
Plug 'scrooloose/syntastic'
Plug 'majutsushi/tagbar'
Plug 'tpope/vim-unimpaired'
Plug 'Shougo/unite.vim'
Plug 'Shougo/vimproc'
Plug 'Shougo/vimshell'
Plug 'Shougo/vinarise'
Plug 'tpope/vim-eunuch'
Plug 'mattn/webapi-vim'
Plug 'mattn/gist-vim'
Plug 'skwp/vim-spec-finder'

" Syntax
Plug 'raymond-w-ko/vim-niji'
Plug 'vim-scripts/Cpp11-Syntax-Support'
Plug 'hail2u/vim-css3-syntax'
Plug 'vim-scripts/ebnf.vim'
Plug 'elixir-lang/vim-elixir'
Plug 'jimenezrick/vimerl'
Plug 'tpope/vim-haml'
Plug 'vim-scripts/haskell.vim'
Plug 'vim-scripts/jam.vim'
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
Plug 'simeji/winresizer'
Plug 'zefei/vim-wintabs'
Plug 'zefei/vim-wintabs-powerline'
Plug 'janko/vim-test'

Plug 'neoclide/coc.nvim', {'branch': 'master', 'do': 'yarn install --frozen-lockfile'}
let g:coc_global_extensions = ['coc-solargraph']

if exists("*nvim_create_namespace")
"  Plug 'APZelos/blamer.nvim'
endif

" Rg
let g:fzf_install = 'yes | ./install'
Plug 'junegunn/fzf', { 'do': g:fzf_install }
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

au VimResized * :wincmd =

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
set magic
set hidden
set shortmess=atI
set wildignore+=*.o,*.obj,.git,*.a,*.so,*.lo,*.class,*.beam,deps/*,Mnesia.*,*.hi,vendor/*,copycat/*,target/*
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
let s:last_window_id = 0
function StatusLine_id(winnr)
	let r = getwinvar(a:winnr, 'window_id')

	if empty(r)
		let r = s:last_window_id
		let s:last_window_id += 1

		call setwinvar(a:winnr, 'window_id', r)
	endif

	" Without this condition it triggers unneeded statusline redraw
	if getwinvar(a:winnr, '&statusline') isnot# '%!StatusLine_render('.r.')'
		call setwinvar(a:winnr, '&statusline', '%!StatusLine_render('.r.')')
	endif

	return r
endfunction

function StatusLine_git()
	if !exists('b:git_dir')
		return
	endif

	let b:git_head = fugitive#head(7)

  let cd  = exists('*haslocaldir') && haslocaldir() ? 'lcd ' : 'cd '
	let dir = getcwd()

  try
		let root = b:git_dir

		if match(root, '\.git$') != -1
			let root = root[0:-5]
		endif

		let full = expand('%:p')
		let rel  = full[strlen(root) : strlen(full)]

		execute cd.root

		let status = system('git status --porcelain --ignored -- ' . shellescape(full))
		if strlen(l:status) != 1
			let b:git_status = l:status[0:2]
		endif

		let diff = system('git branch -v -v | grep "^\*.*[.*?: .*?]" | sed -e "s@^.*\[[A-Za-z]*/[A-Za-z]*: \(.*[0-9][0-9]*\)\]*.*\$@\1@"')
		if strlen(l:diff)
			let b:git_diff = split(l:diff)
		else
			let b:git_diff = []
		endif

		return b:git_status
  finally
    execute cd.'`=dir`'
  endtry
endfunction

function StatusLine_entry(current, bufnr)
	let render = ''

	if a:bufnr == -1
		if a:current
			let render .= "%1*!%*"
		else
			let render .= "%3*!%*"
		endif
	else
		let modifiable = getbufvar(a:bufnr, '&modifiable')
		let readonly   = getbufvar(a:bufnr, '&readonly')
		let modified   = getbufvar(a:bufnr, '&modified')

		if modifiable && !readonly && !modified
			if a:current
				let render .= "%1*!%*"
			else
				let render .= "%3*!%*"
			endif
		endif

		if !modifiable || readonly
			if a:current
				let render .= "%1*⭤%*"
			else
				let render .= "%3*⭤%*"
			endif
		endif

		if modified
			if a:current
				let render .= "%1*+%*"
			else
				let render .= "%3*+%*"
			endif
		endif
	endif

	return render
endfunction

function StatusLine_render_help(winnr, bufnr, current)
	let left    = ""
	let right   = ""

	let left .= "["
	let left .= StatusLine_entry(a:current, -1)
	let left .= " %1*%{expand('%:t:r')}%*"
	let left .= "] "

	let right .= " [%1*help%*]"
	let right .= " [%1*%p%%%*]"

	return left . "%=" . right
endfunction

function StatusLine_render_none(winnr)
	return repeat('─', winwidth(a:winnr))
endfunction

function StatusLine_render_normal(winnr, bufnr, current)
	let left    = ""
	let right   = ""

	if strlen(bufname(a:bufnr))
		let entry = StatusLine_entry(a:current, a:bufnr)

		let left .= "["
		let left .= StatusLine_entry(a:current, a:bufnr)
		if strlen(l:entry)
			let left .= " "
		endif
		let left .= "%2*%{substitute(expand('%:h'), expand('$HOME'), '~', 'g')}/%1*%{expand('%:t')}%*"
		let left .= "] "
	else
		let left .= "[" . StatusLine_entry(a:current, a:bufnr) . "] "
	endif

	let git_head   = getbufvar(a:bufnr, 'git_head')
	let git_status = getbufvar(a:bufnr, 'git_status')
	let git_diff   = getbufvar(a:bufnr, 'git_diff')

	if strlen(l:git_head)
		let left .= "["
		if strlen(l:git_status)
			if l:git_status[1] == 'M' && l:git_status[0] != 'M'
				let left .= "%4*%* "
			elseif l:git_status[0] == 'A' || l:git_status[0] == 'M'
				let left .= "%5*%* "
			elseif l:git_status[0] == 'D'
				let left .= "%6*%* "
			else
				let left .= "%1*%* "
			endif
		else
			let left .= "%1*%* "
		endif
		let left .= "%2*" . l:git_head . "%*"

		if len(l:git_diff) == 2
			let left .= ' '

			if l:git_diff[0] == 'ahead'
				let left .= '>> '
			else
				let left .= '<< '
			endif

			let left .= "%2*" . l:git_diff[1] . "%*"
		endif

		let left .= "] "
	endif

	if strlen(getwinvar(a:winnr, '&filetype'))
		let right .= " [%1*%{&filetype}%* %2*%{&enc}%*]"
	else
		let right .= " [%1*%*%2*%{&enc}%*]"
	endif

	let right .= " [%1*%l%*:%2*%c%* %1*%p%%%*]"

	return left . "%=" . right
endfunction

function StatusLine_render(window_id)
	let winnr   = index(map(range(1, winnr('$')), 'StatusLine_id(v:val)'), a:window_id) + 1
	let bufnr   = winbufnr(l:winnr)
	let current = w:window_id is# a:window_id

	if getwinvar(l:winnr, '&filetype') == 'help'
		return StatusLine_render_help(l:winnr, l:bufnr, l:current)
	elseif bufname(l:bufnr) =~ "NERD_tree" || bufname(l:bufnr) =~ "Tagbar" || getwinvar(l:winnr, '&filetype') == 'startify'
		return StatusLine_render_none(l:winnr)
	else
		return StatusLine_render_normal(l:winnr, l:bufnr, l:current)
	endif
endfunction

function StatusLine_new()
	call map(range(1, winnr('$')), 'StatusLine_id(v:val)')
endfunction

"autocmd BufWritePost * call StatusLine_git()
"autocmd BufReadPost *  call StatusLine_git()
"autocmd WinEnter *  call StatusLine_git()
"autocmd VimEnter * call StatusLine_git()

set showmode
set laststatus=2
set statusline=%!StatusLine_new()
call StatusLine_new()

" Commands
command! -range=% Share silent <line1>,<line2>write !curl -s -F "sprunge=<-" http://sprunge.us | head -n 1 | tr -d '\r\n ' | DISPLAY=:0.0 xclip
command! -nargs=1 Indentation silent set ts=<args> shiftwidth=<args>
command! -nargs=1 IndentationLocal silent setlocal ts=<args> shiftwidth=<args>

map <silent> <PageUp> 1000<C-U>
map <silent> <PageDown> 1000<C-D>
imap <silent> <PageUp> <C-O>1000<C-U>
imap <silent> <PageDown> <C-O>1000<C-D>

" Disable arrows to learn to stop using them
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
nmap <Leader>f :CommandT<CR>
nmap <Leader>b :CommandTBuffer<CR>
nmap <Leader>t :CommandTTag<CR>
nmap <Leader>r :CommandTFlush<CR>
nmap <Leader>y :YcmShowDetailedDiagnostic<CR>

nmap <Leader>s :mksession! .vim.session<CR>
nmap <Leader>n :nohlsearch<CR>

nmap <Leader>N :NERDTreeToggle<CR>
nmap <Leader>T :TagbarToggle<CR>
nmap <Leader>U :GundoToggle<CR>
nmap <Leader>Y :YcmDiags<CR>
nmap <Leader>R :YcmCompleter ClearCompilationFlagCache<CR>:YcmForceCompileAndDiagnostics<CR>
nmap <Leader>S :SyntasticCheck<CR>

vnoremap <silent> <Enter> :EasyAlign<CR>

" Rust syntax
let g:rust_recommended_style = 1

" delimitMate
let g:delimitMate_no_esc_mapping = 1

" NERDComment (leader-c-space for toggling)
let g:NERDCommentEmptyLines = 1
let g:NERDTrimTrailingWhitespace = 1

" NERDTree
let NERDTreeIgnore=['\.so$', '\.o$', '\.la$', '\.a$', '\.class$', '\~$', '\.beam$', '^Mnesia.', 'deps/', '\.hi$', 'vendor/', 'target/']

" NERDTree when no file are opened
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" Close vim if the only window left open is a NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" NoHomo
let g:nohomo_ignore_filetype = ['mail', 'markdown', 'scss', 'mustache']

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
                           \ 'passive_filetypes': ['elixir', 'javascript'] }

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

" Command-T
let g:CommandTMaxFiles          = 100000
let g:CommandTMaxDepth          = 100
let g:CommandTNeverShowDotFiles = 1

" cctree
let g:CCTreeUsePerl        = 1
let g:CCTreeUseUTF8Symbols = 1

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

" vimshell
" let g:vimshell_environment_term       = 'rxvt-256color'
let g:vimshell_scrollback_limit       = 10240

autocmd FileType vimshell
	\ nnoremap <silent> <C-k> :wincmd k<CR>

autocmd FileType int-*
	\ nnoremap <silent> <C-k> :wincmd k<CR>

" vinarise
let g:vinarise_enable_auto_detect = 1
let g:vinarise_detect_large_file_size = -1

autocmd FileType vinarise
	\  nmap <buffer> <C-l> :wincmd l<CR>
	\| nmap <buffer> <C-c> <Plug>(vinarise_redraw)

" gist
let g:gist_detect_filetype = 1
let g:gist_open_browser_after_post = 1
let g:gist_browser_command = 'echo %URL% | xclip'

func! DeleteTrailingWS()
  exe "normal mz"
  %s/\s\+$//ge
  exe "normal `z"
endfunc

autocmd BufWrite * :call DeleteTrailingWS()

"set background=dark
"colorscheme base16-monokai

" Resize
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
" todo: fold everything
"
set foldmethod=syntax
set nofoldenable
set foldlevel=99

source ~/.config/nvim/coc.vim
source ~/.config/nvim/spec-finder.vim
