set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'kien/ctrlp.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'Shougo/neocomplcache.vim'
Plugin 'tomtom/tcomment_vim'
Plugin 'bling/vim-airline'
Plugin 'fholgado/minibufexpl.vim'
Plugin 'groenewege/vim-less'
Plugin 'Yggdroot/indentLine'
Plugin 'einars/js-beautify'
Plugin 'maksimr/vim-jsbeautify'
Plugin 'Chiel92/vim-autoformat'
Plugin 'wookiehangover/jshint.vim'
Plugin 'scrooloose/syntastic'
" tmux
" Plugin 'christoomey/vim-tmux-navigator'

" Color Themes
Plugin 'flazz/vim-colorschemes'
" Plugin 'jelera/vim-javascript-syntax'
" Plugin 'majutsushi/tagbar'
"
" Ruby stuff
" Plugin 'vim-ruby/vim-ruby'

" Startify FTW
" Bundle 'mhinz/vim-startify'

" ANSI escaping for output
" Bundle 'vim-scripts/AnsiEsc.vim'

colorscheme jellybeans
set transparency=50

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
set encoding=utf-8
"2 space tab tabbing:
"set noexpandtab
""set tabstop=2
"set softtabstop=2
""set shiftwidth=2

" 4 space tabbing (with no tabs) this sucks but I have to use it
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
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

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" exit insert mode 
inoremap <C-c> <Esc>

set completeopt=menuone,longest,preview

" This allows buffers to be hidden if you've modified a buffer.
" This is almost a must if you wish to use buffers in this way.
set hidden

" CtrlP
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/node_modules/*,*/package/Package/*,*/dist/*

" do not history when leaving buffer
set hidden


" Use <C-L> to clear the highlighting of :set hlsearch.
if maparg('<C-L>', 'n') ==# ''
  nnoremap <silent> <C-L> :nohlsearch<CR><C-L>
endif

inoremap <C-U> <C-G>u<C-U>

" " Don't use Ex mode, use Q for formatting
" map Q gq

" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
  set mouse=a
endif

noremap  <C-S> :update<CR>
vnoremap <C-S> <C-C>:update<CR>
inoremap <C-S> <Esc>:update<CR>

" Find
map <C-f> /
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

" Move to the next buffer
nmap <C-S-Right> :bnext<CR>

" Move to the previous buffer
nmap <C-S-Left> :bprevious<CR>

" Show all open buffers and their status
nmap <leader>bls :ls<CR>

" Move to the next tab
nmap <C-S-t-Right> :gt<CR>
" Move to the last tab
nmap <C-S-t-Left> :gT<CR>

" Add JsDoc for the current function
nmap <leader>j :JsDoc<CR>

" Tern stuff
" nmap <leader>TR :TernRefs<CR>
" nmap <leader>TD :TernDef<CR>
" nmap <leader>Tr :TernRename<CR>
" nmap <leader>TT :TernType<CR>

" startify stuff
let g:startify_session_dir = "~/.vim/sessions"

" automati omnincomplete
let g:neocomplcache_enable_at_startup = 1

" airline settings
set guifont=Sauce\ Code\ Powerline\ Semibold:h14
let g:airline_powerline_fonts = 1
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
let g:ruby_debugger_progname = 'mvim'
let g:ruby_debugger_debug_mode = 1

nmap <leader>t :TagbarToggle<CR>

" this machine config
if filereadable(expand("~/.vimrc.local"))
  source ~/.vimrc.local
endif

" Set the backups/undos/swaps to go to centralized locations:
set directory=~/.vim/swap//
try
set undodir=~/.vim/undo//
    set undofile
catch /Unknown option/
    " For versions of Vim prior to 7.3
endtry

" Project-specific settings:
"au BufEnter *Projects/FuelUX/* call s:real_tab()
"au BufEnter *Projects/FuelUX2/* call s:real_tab()
au BufEnter *www/ETElements/constellation/* call s:real_tab()
au BufEnter *www/ETElements/FuelSwitch/* call s:real_tab()
au BufEnter *www/fuelux-facades/* call s:real_tab()
au BufEnter *www/ContactModels/* call s:two_tab()
au BufEnter *www/Contacts-QE-Automated-Tests/* call s:two_tab()

function! s:real_tab()
  " Two space tabbing:
  set noexpandtab
endfun

function! s:two_tab()
  " Two space tabbing:
  set expandtab
  set tabstop=4
  set softtabstop=4
  set shiftwidth=2
endfun

" Fix janky files
function! FixJanky()
  %s/\r//ge " Remove DOS line endings
  %s/\s\+$//e " Remove trailing whitespace
  retab " Fix mixed tabs and spaces
  call feedkeys("\<C-o>")
endfun
nnoremap <silent> <Leader>f :call FixJanky()<CR>

" Format XML:
function! DoPrettyXML()
  " save the filetype so we can restore it later
  let l:origft = &ft
  set ft=
  " delete the xml header if it exists. This will
  " permit us to surround the document with fake tags
  " without creating invalid xml.
  1s/<?xml .*?>//e
  " insert fake tags around the entire document.
  " This will permit us to pretty-format excerpts of
  " XML that may contain multiple top-level elements.
  0put ='<PrettyXML>'
  $put ='</PrettyXML>'
  silent %!xmllint --format -
  " xmllint will insert an <?xml?> header. it's easy enough to delete
  " if you don't want it.
  " delete the fake tags
  2d
  $d
  " restore the 'normal' indentation, which is one extra level
  " too deep due to the extra tags we wrapped around the document.
  silent %<
  " back to home
  1
  " restore the filetype
  exe "set ft=" . l:origft
endfunction

command! PrettyXML call DoPrettyXML()
nnoremap <silent> <Leader>x :call DoPrettyXML()<CR>


  " or
au FileType javascript noremap <buffer>  <c-f> :call JsBeautify()<cr>
" au FileType javascript call JavaScriptFold()
  " for html
au FileType html noremap <buffer> <c-f> :call HtmlBeautify()<cr>
  " for css or scss
au FileType css noremap <buffer> <c-f> :call CSSBeautify()<cr>

  " for selected text
au FileType javascript vnoremap <buffer>  <c-f> :call RangeJsBeautify()<cr>
au FileType html vnoremap <buffer> <c-f> :call RangeHtmlBeautify()<cr>
au FileType css vnoremap <buffer> <c-f> :call RangeCSSBeautify()<cr>

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

" Meta+1-0 jumps to tab 1-10, Shift+Meta+1-0 jumps to tab 11-20:
let s:windowmapnr = 0
let s:wins='1234567890!@#$%^&*()'
while (s:windowmapnr < strlen(s:wins))
    exe 'noremap <silent> <M-' . s:wins[s:windowmapnr] . '> ' . (s:windowmapnr + 1) . 'gt'
    exe 'inoremap <silent> <M-' . s:wins[s:windowmapnr] . '> <C-O>' . (s:windowmapnr + 1) . 'gt'
    exe 'cnoremap <silent> <M-' . s:wins[s:windowmapnr] . '> <C-C>' . (s:windowmapnr + 1) . 'gt'
    exe 'vnoremap <silent> <M-' . s:wins[s:windowmapnr] . '> <C-C>' . (s:windowmapnr + 1) . 'gt'
    let s:windowmapnr += 1
endwhile
unlet s:windowmapnr s:wins

" disable the startup screen
set shortmess+=I
execute pathogen#infect()
call pathogen#helptags()
