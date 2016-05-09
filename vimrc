set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'Shougo/neocomplcache.vim'
Plugin 'tomtom/tcomment_vim'
Plugin 'bling/vim-airline'
Plugin 'fholgado/minibufexpl.vim'
Plugin 'groenewege/vim-less'
Plugin 'Yggdroot/indentLine'
Plugin 'scrooloose/syntastic'
Plugin 'pangloss/vim-javascript'
Plugin 'mxw/vim-jsx'
Plugin 'ryanoasis/vim-devicons'
Plugin 'ryanoasis/nerd-fonts'

" tmux
" Plugin 'christoomey/vim-tmux-navigator'

" Color Themes
Plugin 'flazz/vim-colorschemes'
" Plugin 'jelera/vim-javascript-syntax'

" Startify
" Plugin 'mhinz/vim-startify'


colorscheme jellybeans
set transparency=10

""""""""
call vundle#end()


filetype plugin indent on

autocmd FileType ruby compiler ruby

if has('syntax') && !exists('g:syntax_on')
  syntax enable
endif

filetype plugin on
set omnifunc=syntaxcomplete#Complete

" Use :help 'option' to see the documentation for the given option.
set autoindent
set smartindent
set backspace=indent,eol,start
set complete-=i
set showmatch
set matchtime=1
set showmode
set smarttab

" Don't automatically resizel panes
set noequalalways

set nrformats-=octal
set shiftround

set ttimeout
set ttimeoutlen=50

set laststatus=2
set ruler
set showcmd
set wildmenu
set autoread
"set foldlevelstart=99 " don't fold everything by default
set nofoldenable
set encoding=utf8


set listchars=tab:▒░,trail:▓,eol:¬
set list
set incsearch

set number
set hlsearch
set ignorecase
set smartcase

set nobackup
set nowritebackup
set noswapfile
set fileformats=unix,dos,mac


" syntastic settings
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
"
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:indentLine_conceallevel = 0
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_enable_signs = 1
let g:syntastic_loc_list_height=4

" Allow JSX in js files
let g:jsx_ext_required = 0


set completeopt=menuone,longest,preview

" This allows buffers to be hidden if you've modified a buffer.
" This is almost a must if you wish to use buffers in this way.
set hidden

" CtrlP
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/node_modules/*,*/dist/*

" do not history when leaving buffer
set hidden


" Use <C-L> to clear the highlighting of :set hlsearch.
if maparg('<C-L>', 'n') ==# ''
  nnoremap <silent> <C-L> :nohlsearch<CR><C-L>
endif

inoremap <C-U> <C-G>u<C-U>

" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
  set mouse=a
endif

noremap  <C-S> :update<CR>
vnoremap <C-S> <C-C>:update<CR>
inoremap <C-S> <Esc>:update<CR>

" indend / deindent after selecting the text with (⇧ v), (.) to repeat.
vnoremap <Tab> >
vnoremap <S-Tab> <
" comment / decomment & normal comment behavior
vmap <C-m> gc
" Disable tComment to escape some entities
let g:tcomment#replacements_xml={}
" Text wrap simpler, then type the open tag or ',"
vmap <C-w> S

" lazy ':'
map \ :

let mapleader = ','
noremap  <Leader>; :NERDTreeToggle<CR>
let NERDTreeChDirMode=0

" Move to the next buffer
nmap <C-S-Right> :bnext<CR>

" Move to the previous buffer
nmap <C-S-Left> :bprevious<CR>

" Show all open buffers and their status
nmap <leader>bls :ls<CR>

" Pane resize by 10px each arrow
nmap <D-S-Left> :vertical resize -1<CR>
nmap <D-S-Right> :vertical resize +1<CR>
nmap <D-S-Down> :resize -1<CR>
nmap <D-S-Up> :resize +1<CR>

" " Move to the next tab
" nmap <C-S-t-Right> :gt<CR>
" " Move to the last tab
" nmap <C-S-t-Left> :gT<CR>

" Add JsDoc for the current function
nmap <leader>j :JsDoc<CR>

" Tern stuff
" nmap <leader>TR :TernRefs<CR>
" nmap <leader>TD :TernDef<CR>
" nmap <leader>Tr :TernRename<CR>
" nmap <leader>TT :TernType<CR>

" startify stuff. Its kinda annoying.
" let g:startify_session_dir = "~/.vim/sessions"

" automati omnincomplete
let g:neocomplcache_enable_at_startup = 1

" airline settings
let g:airline_powerline_fonts = 1
set guifont=Sauce\ Code\ Pro\:h11

if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

let g:airline_symbols.space = "\ua0"
let g:airline_theme = 'hybrid'

"airline tabs
" let g:airline#extensions#tabline#enabled = 1

" only run jshint at save time
let JSHintUpdateWriteOnly=1

" ruby debugger
" let g:ruby_debugger_progname = 'mvim'
" let g:ruby_debugger_debug_mode = 1

" nmap <leader>t :TagbarToggle<CR>

" this machine config
if filereadable(expand("~/.vimrc.local"))
  source ~/.vimrc.local
endif

" Set the backups/undos/swaps to go to centralized locations:
set directory=~/.vim/swap//

" Put plugins and dictionaries in this dir (also on Windows)
let vimDir = '$HOME/.vim'
let &runtimepath.=','.vimDir

" Keep undo history across sessions by storing it in a file
if has('persistent_undo')
	let myUndoDir = expand(vimDir . '/undo')
	" Create dirs
	call system('mkdir ' . vimDir)
	call system('mkdir ' . myUndoDir)
	let &undodir = myUndoDir
	set undofile
endif

function! s:two_tab()
  " Two space tabbing:
  set expandtab
  set tabstop=4
  set softtabstop=4
  set shiftwidth=2
endfun

function! s:real_tab()
  " Two space tabbing:
  set noexpandtab
endfun

" Project-specific settings:
au BufEnter *Projects/* call s:real_tab()

" by default use real tabs
set noexpandtab
set tabstop=4
set shiftwidth=4

" don't use escape to get out of insert mode
inoremap jk <esc>

" Not using JSBEAUTIFY ATM until there is better es6 support.
" au FileType javascript noremap <buffer>  <c-f> :call JsBeautify()<cr>
" " au FileType javascript call JavaScriptFold()
"   " for html
" au FileType html noremap <buffer> <c-f> :call HtmlBeautify()<cr>
"   " for css or scss
" au FileType css noremap <buffer> <c-f> :call CSSBeautify()<cr>
"
"   " for selected text
" au FileType javascript vnoremap <buffer>  <c-f> :call RangeJsBeautify()<cr>
" au FileType html vnoremap <buffer> <c-f> :call RangeHtmlBeautify()<cr>
" au FileType css vnoremap <buffer> <c-f> :call RangeCSSBeautify()<cr>

" for Ruby
au FileType ruby vnoremap <buffer> <c-f> :call Autoformat()<cr>


" Called once right before you start selecting multiple cursors
function! Multiple_cursors_before()
  if exists(':NeoCompleteLock')==2
	exe 'NeoCompleteLock'
  endif
endfunction

" Called once only when the multiple selection is canceled (default <Esc>)
function! Multiple_cursors_after()
  if exists(':NeoCompleteUnlock')==2
	exe 'NeoCompleteUnlock'
  endif
endfunction


" disable the startup screen
set shortmess+=I
