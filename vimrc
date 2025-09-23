set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'zefei/vim-wintabs'
" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'

Plugin 'dense-analysis/ale'

Plugin 'scrooloose/nerdtree'
Plugin 'vim-airline/vim-airline'
let g:airline#extensions#ale#enabled = 1
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'tomtom/tcomment_vim'
Plugin 'Yggdroot/indentLine'
Plugin 'pangloss/vim-javascript'
Plugin 'chrisbra/Colorizer'
" Typscript stuff
Plugin 'leafgarland/typescript-vim'
" Color Themes
Plugin 'flazz/vim-colorschemes'

" Startify
Plugin 'mhinz/vim-startify'

" Prettier
Plugin 'prettier/vim-prettier'

Plugin 'mxw/vim-jsx'

" gemini
Plugin 'mattn/vim-gemini'

" vim-prettier
let g:prettier#autoformat = 0
autocmd BufWritePre *.js,*.jsx,*.css,*.less,*.scss,*.json,*.graphql PrettierAsync

" colorizer things
let g:colorizer_auto_color = 0

colorscheme jellybeans

" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
" git repos on your local machine (i.e. when working on your own plugin)
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" j k to exit insert mode
inoremap jk <esc>
let &t_SI = "\e[5 q" " Blinking I-beam in insert mode
let &t_EI = "\e[2 q" " Steady block in normal mode
let &t_SR = "\e[3 q" " Blinking underline in replace mode

" Enable syntax highlighting
syntax on

" Enable file type detection
filetype plugin indent on

" ALE configuration
let g:ale_set_highlights = 1
let g:ale_set_loclist = 1
let g:ale_set_quickfix = 1
let g:ale_set_signs = 1

" Customize linting for specific file types
" Java
let g:ale_java_checkstyle_executable = 'checkstyle'
let g:ale_java_checkstyle_options = '--config /path/to/checkstyle.xml'

" JavaScript
let g:ale_javascript_eslint_executable = 'eslint'
let g:ale_javascript_eslint_options = '--fix'

" Ruby
let g:ale_ruby_rubocop_executable = 'rubocop'

" Python
let g:ale_python_flake8_executable = 'flake8'

" HTML
let g:ale_html_tidy_executable = 'tidy'

" CSS
let g:ale_css_stylelint_executable = 'stylelint'

" SQL
let g:ale_sql_sqlfmt_executable = 'sqlfmt'

" Generic linter for other languages
let g:ale_fixers = {
\   '*': ['prettier'],
\   'json': ['jsonlint'],
\}

set number

let mapleader = ","
nnoremap <leader>; :NERDTreeToggle<CR>
set encoding=utf8
set showbreak=↪\
set listchars=tab:→\ ,eol:¬,nbsp:␣,trail:▓,extends:⟩,precedes:⟨
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

" system clipboard
set clipboard=unnamed

set completeopt=menuone,longest
set tabstop=4
set shiftwidth=4
set expandtab

let g:tcomment#replacements_xml={}

let mapleader = ','
noremap  <Leader>; :NERDTreeToggle<CR>
let NERDTreeChDirMode=0
let NERDTreeShowHidden=1

" Move to the next buffer
nmap <Tab> :WintabsNext<CR>
nmap <S-Tab> :WintabsPrevious<CR>

" " Move to the previous buffer
nmap <S-Tab> <c-w>w

" Show all open buffers and their status
nmap <leader>bls :ls<CR>

" Pane resize by 10px each arrow
nmap <S-C-Left> :vertical resize -2<CR>
nmap <S-C-Right> :vertical resize +2<CR>
nmap <S-C-Down> :resize -2<CR>
nmap <S-C-Up> :resize +2<CR>

" startify stuff. Its kinda annoying.
let g:startify_session_dir = "~/.vim/sessions"
let g:startify_custom_header = []

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