set nocompatible
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'
Bundle 'terryma/vim-multiple-cursors'
Bundle 'kien/ctrlp.vim'
Bundle 'scrooloose/nerdtree'
Bundle 'Shougo/neocomplcache.vim'
Bundle 'Shutnik/jshint2.vim'
Bundle 'tomtom/tcomment_vim'
Bundle 'bling/vim-airline'
Bundle 'fholgado/minibufexpl.vim'
Bundle 'groenewege/vim-less'
Bundle 'Yggdroot/indentLine'
Bundle 'maksimr/vim-jsbeautify'
Bundle 'einars/js-beautify'
Bundle 'heavenshell/vim-jsdoc'
" Color Themes
Bundle 'flazz/vim-colorschemes'
Plugin 'jelera/vim-javascript-syntax'
"Bundle 'majutsushi/tagbar'
Bundle 'marijnh/tern_for_vim'
"
" Ruby stuff
Bundle 'astashov/vim-ruby-debugger'
Bundle 'vim-ruby/vim-ruby'

" Startify FTW
Bundle 'mhinz/vim-startify'

colorscheme jellybeans

""""""""
if has('autocmd')
  filetype plugin indent on
endif
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
set transparency=5
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

" Don't use Ex mode, use Q for formatting
map Q gq

" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
  set mouse=a
endif


" FIXME: (broken) ctrl s to save
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

" Add JsDoc for the current function
nmap <leader>j :JsDoc<CR>

" Tern stuff
nmap <leader>TR :TernRefs<CR>
nmap <leader>TD :TernDef<CR>
nmap <leader>Tr :TernRename<CR>
nmap <leader>TT :TernType<CR>


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
"let g:airline#extensions#tabline#enabled = 1

" jshint validation
nnoremap <silent><F1> :JSHint<CR>
inoremap <silent><F1> <C-O>:JSHint<CR>
vnoremap <silent><F1> :JSHint<CR>

" show next jshint error
nnoremap <silent><F2> :lnext<CR>
inoremap <silent><F2> <C-O>:lnext<CR>
vnoremap <silent><F2> :lnext<CR>

" show previous jshint error
nnoremap <silent><F3> :lprevious<CR>
inoremap <silent><F3> <C-O>:lprevious<CR>
vnoremap <silent><F3> :lprevious<CR>
"DON'T Lint JavaScript files after saving it:
let jshint2_save = 0
" DONT lint after reading (trigger only)
let jshint2_read = 0
" skip lint confirmation for non-js:
let jshint2_confirm = 0
"default error list height
let jshint2_hight = 20

" ruby debugger
let g:ruby_debugger_progname = 'mvim'
let g:ruby_debugger_debug_mode = 1

"nmap <F8> :TagbarToggle<CR>
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


map <c-f> :call JsBeautify()<cr>
  " or
autocmd FileType javascript noremap <buffer>  <c-f> :call JsBeautify()<cr>
au FileType javascript call JavaScriptFold()
  " for html
autocmd FileType html noremap <buffer> <c-f> :call HtmlBeautify()<cr>
  " for css or scss
autocmd FileType css noremap <buffer> <c-f> :call CSSBeautify()<cr>

  " for selected text
autocmd FileType javascript vnoremap <buffer>  <c-f> :call RangeJsBeautify()<cr>
autocmd FileType html vnoremap <buffer> <c-f> :call RangeHtmlBeautify()<cr>
autocmd FileType css vnoremap <buffer> <c-f> :call RangeCSSBeautify()<cr>

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
