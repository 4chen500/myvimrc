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
Plugin 'groenewege/vim-less'
Plugin 'Yggdroot/indentLine'
Plugin 'scrooloose/syntastic'
Plugin 'pangloss/vim-javascript'
Plugin 'mxw/vim-jsx'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'mileszs/ack.vim'
Plugin 'lilydjwg/colorizer'
Plugin 'tpope/vim-fugitive'
Plugin 'Xuyuanp/nerdtree-git-plugin'

" Color Themes
Plugin 'flazz/vim-colorschemes'

" Startify
Plugin 'mhinz/vim-startify'


colorscheme jellybeans

""""""""
call vundle#end()


filetype plugin indent on

autocmd FileType ruby compiler ruby

if has('syntax') && !exists('g:syntax_on')
  syntax enable
endif

" ack-ag-vim stuff
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

filetype plugin on
set omnifunc=syntaxcomplete#Complete
"" Highlight unused imports, first saves, clears previous matches
nnoremap <leader>ji :w<CR>:call clearmatches()<CR>:let cmd = system('unused -v true ' . expand('%'))<CR>:exec cmd<CR>

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

set showbreak=↪\
set listchars=tab:→\ ,eol:¬,nbsp:␣,trail:•,extends:⟩,precedes:⟨
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
let g:indentLine_conceallevel = 0
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_aggregate_errors = 1
let g:syntastic_enable_signs = 1
let g:syntastic_loc_list_height = 4

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
let NERDTreeShowHidden=1

" Move to the next buffer
nmap <Tab> :bnext<CR>

" " Move to the previous buffer
nmap <S-Tab> <c-w>w

" Show all open buffers and their status
nmap <leader>bls :ls<CR>

" Pane resize by 10px each arrow
nmap <S-C-Left> :vertical resize -2<CR>
nmap <S-C-Right> :vertical resize +2<CR>
nmap <S-C-Down> :resize -2<CR>
nmap <S-C-Up> :resize +2<CR>

" " Move to the next tab
" nmap <C-S-t-Right> :gt<CR>
" " Move to the last tab
" nmap <C-S-t-Left> :gT<CR>

" " Add JsDoc for the current function
" nmap <leader>j :JsDoc<CR>

" Tern stuff
" nmap <leader>TR :TernRefs<CR>
" nmap <leader>TD :TernDef<CR>
" nmap <leader>Tr :TernRename<CR>
" nmap <leader>TT :TernType<CR>

" startify stuff. Its kinda annoying.
let g:startify_session_dir = "~/.vim/sessions"

" automati omnincomplete
let g:neocomplcache_enable_at_startup = 1


"airline tabs
let g:airline#extensions#tabline#enabled = 1

" only run jshint at save time
" let JSHintUpdateWriteOnly=1
let g:airline#extensions#tabline#buffer_nr_show = 1
" ruby debugger
" let g:ruby_debugger_progname = 'mvim'
" let g:ruby_debugger_debug_mode = 1
let g:tagbar_ctags_bin='/usr/local/bin/ctags'  " Proper Ctags locations
let g:tagbar_width=26
nmap <leader>t :TagbarToggle<CR>

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

let g:multi_cursor_exit_from_insert_mode = 0

" Save on esc esc
map <Esc><Esc> :w<CR>

" disable the startup screen
set shortmess+=I

let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"
autocmd InsertEnter * set cul
autocmd InsertLeave * set nocul

source ~/.vim-quotes
