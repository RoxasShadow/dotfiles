" Plugins
call plug#begin('~/.vim/plugged')

Plug 'adelarsq/vim-matchit'
Plug 'dstein64/vim-startuptime'
Plug 'mileszs/ack.vim'
Plug 'ciaranm/detectindent'
Plug 'vim-scripts/DrawIt'

Plug 'unblevable/quick-scope'
let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']
let g:qs_highlight_on_keys = ['f', 'F']

" Functionalities
Plug 'tpope/vim-surround' " e.g. ys$
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-eunuch'
Plug 'dylanaraps/root.vim'

Plug 'paradigm/vim-multicursor'
Plug 'Shougo/unite.vim'
Plug 'skwp/vim-spec-finder'
Plug 'zefei/vim-wintabs'
Plug 'zefei/vim-wintabs-powerline'
Plug 'easymotion/vim-easymotion' " ;;j
Plug 'Yggdroot/indentLine'

" Copilot
Plug 'github/copilot.vim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'CopilotC-Nvim/CopilotChat.nvim'
Plug 'nvim-treesitter/nvim-treesitter' " TSInstall diff

" Snippets
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
let g:UltiSnipsEditSplit="vertical" ":UltiSnipsEdit

" ChatGTP
Plug 'nvim-lua/plenary.nvim'
Plug 'MunifTanjim/nui.nvim'
Plug 'jackMort/ChatGPT.nvim'

" startify
Plug 'mhinz/vim-startify'
let g:startify_skiplist = [
      \ 'COMMIT_EDITMSG',
      \ $VIMRUNTIME .'/doc',
      \ 'bundle/.*/doc' ,
      \ 'vimpager'
      \ ]
let g:startify_change_to_vcs_root=1
let g:startify_bookmarks = [ '~/.config/nvim/plugins.vim', '~/.zshrc' ]

Plug 'kdheepak/lazygit.nvim'
" setup mapping to call :LazyGit ;gh
nnoremap <silent> <Leader>gh :LazyGit<CR>

Plug 'danchoi/ri.vim'
nnoremap <Leader>ri :call ri#OpenSearchPrompt(0)<CR>
nnoremap <Leader>RI :call ri#OpenSearchPrompt(1)<CR>
nnoremap <Leader>RK :call ri#LookupNameUnderCursor()<CR>

" Resize (also Ctrl+t)
Plug 'simeji/winresizer'
nnoremap <silent> <Leader>+ :exe "resize " . (winheight(0) * 3/2)<CR>
nnoremap <silent> <Leader>- :exe "resize " . (winheight(0) * 2/3)<CR>
nnoremap <silent> <Leader>> :vertical res -3<<CR>
nnoremap <silent> <Leader>< :vertical res +3<<CR>
let g:winresizer_start_key = '<C-T>'

" Test
Plug 'janko/vim-test'
let test#strategy = "neovim"
let g:test#preserve_screen = 1
let test#neovim#term_position = "botright 20"
" let test#ruby#use_spring_binstub = 1

" EasyAlign
Plug 'junegunn/vim-easy-align'
vnoremap <silent> <Enter> :EasyAlign<CR>
nmap <Leader>tab :EasyAlign*:<CR>
vmap <Leader>tab :EasyAlign*:<CR>

" FastFold
Plug 'Konfekt/FastFold'
let g:fastfold_savehook = 1
let g:fastfold_fold_command_suffixes =  ['x','X','a','A','o','O','c','C']
let g:fastfold_fold_movement_commands = [']z', '[z', 'zj', 'zk']
nmap zuz <Plug>(FastFoldUpdate)

" Signify
Plug 'mhinz/vim-signify'
let g:signify_sign_overwrite = 1
let g:signify_sign_overwrite = 1

" FZF
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
nnoremap <c-p> :Files<CR>

" Syntastic
Plug 'scrooloose/syntastic'
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

" Neoformat
" Plug 'sbdchd/neoformat'
" let g:neoformat_only_msg_on_error = 1
" augroup fmt
"   autocmd!
"   au BufWritePre * try | undojoin | Neoformat | catch /^Vim\%((\a\+)\)\=:E790/ | finally | silent Neoformat | endtry
" augroup END

" Splitjoin (gS/gJ) / gq
Plug 'AndrewRadev/splitjoin.vim'
nmap sj :SplitjoinSplit<cr>

" Tagbar
Plug 'majutsushi/tagbar'
nnoremap <C-g> :TagbarToggle<CR>
" autocmd VimEnter * TagbarToggle

" NERDTree
Plug 'preservim/nerdtree'
let NERDTreeIgnore=['\.so$', '\.o$', '\.la$', '\.a$', '\.class$', '\~$', '\.beam$', '^Mnesia.', 'deps/', '\.hi$', 'vendor/', 'target/']
noremap <C-f> :NERDTreeFind<CR>

" Undo graph
Plug 'simnalamburt/vim-mundo'
nmap <C-u> :MundoToggle<CR>

" git sign diff
Plug 'mhinz/vim-signify'
let g:signify_sign_overwrite = 1
let g:signify_vcs_list = ["git"]

" Syntax
Plug 'raymond-w-ko/vim-niji'
Plug 'vim-scripts/Cpp11-Syntax-Support'
Plug 'hail2u/vim-css3-syntax'
Plug 'jimenezrick/vimerl'
Plug 'tpope/vim-haml'
Plug 'vim-scripts/haskell.vim'
Plug 'vim-scripts/JSON.vim'
Plug 'groenewege/vim-less'
Plug 'juvenn/mustache.vim'
Plug 'programble/ooc.vim'
Plug 'udalov/kotlin-vim'
Plug 'petdance/vim-perl'
Plug 'uarun/vim-protobuf'
Plug 'vim-scripts/rfc-syntax'
Plug 'jlcrochet/vim-ruby'
Plug 'cespare/vim-toml'
Plug 'bumaociyuan/vim-swift'
Plug 'jamessan/vim-gnupg'
Plug 'hashivim/vim-terraform'

" Rust
Plug 'rust-lang/rust.vim'
let g:rust_recommended_style = 1

" Markdown
Plug 'tpope/vim-markdown'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install'  }
let g:markdown_fenced_languages = ['html', 'python', 'bash=sh', 'rust', 'json']
let g:markdown_folding = 0

" Javascript
Plug 'peitalin/vim-jsx-typescript'
Plug 'pangloss/vim-javascript'
Plug 'HerringtonDarkholme/yats.vim'
Plug 'styled-components/vim-styled-components', { 'branch': 'main' }

" CoC
Plug 'neoclide/coc.nvim', {'branch': 'release'}
let g:coc_global_extensions = ['coc-solargraph']

if isdirectory('./node_modules') && isdirectory('./node_modules/prettier')
  let g:coc_global_extensions += ['coc-prettier']
endif

if isdirectory('./node_modules') && isdirectory('./node_modules/eslint')
  let g:coc_global_extensions += ['coc-eslint']
endif

" CoC signature of functions in floating text from docs
Plug 'Shougo/echodoc.vim'
let g:echodoc#enable_at_startup = 1
let g:echodoc#type = 'floating'
highlight link EchoDocFloat Pmenu

" Autocompletion manager
" Plug 'ncm2/ncm2'
" Plug 'roxma/nvim-yarp'
" Plug 'ncm2/ncm2-path'
" Plug 'ncm2/ncm2-cssomni'
" Plug 'ncm2/ncm2-coc'

" autocmd BufEnter * call ncm2#enable_for_buffer()
" autocmd TextChangedI * call ncm2#auto_trigger()

" Show blame at every line
" if exists("*nvim_create_namespace")
  "  Plug 'APZelos/blamer.nvim'
  "  let g:blamer_enabled = 0
  "  ":call BlamerToggle
  "  let g:blamer_delay = 500
" endif

call plug#end()
