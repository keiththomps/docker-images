set nocompatible " be iMproved, required
filetype off     " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" install languages packages
Plugin 'elixir-lang/vim-elixir'

" install Web development related packages (JS, HTML, CSS)
Plugin 'mxw/vim-jsx'
Plugin 'jelera/vim-javascript-syntax'
Plugin 'pangloss/vim-javascript'
Plugin 'Shutnik/jshint2.vim'
Plugin 'othree/html5.vim'
Plugin 'lukaszb/vim-web-indent'
Plugin 'cakebaker/scss-syntax.vim'

" install utility packages
Plugin 'tpope/vim-endwise'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-commentary'
Plugin 'scrooloose/syntastic'
Plugin 'kien/ctrlp.vim.git'
Plugin 'jlanzarotta/bufexplorer'
Plugin 'rstacruz/sparkup'

" install theme
Plugin 'altercation/vim-colors-solarized'

" All plugins are loaded, stop Vundle
call vundle#end()         " required
filetype plugin indent on " required
syntax enable
set number

let mapleader= "," " Remap Leader to ,

" Global tab width.
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab

syntax enable       " turn on file syntax highlighting
set hidden          " handle multiple buffers better.
set backspace=indent,eol,start " Intuitive backspacing.
set title           " set terminal title
set wrap            " turn on line wrapping
set number          " show line numbers
set ruler           " show cursor position in bottom bar (vim-airline overrides)
set autoindent      " match indentation level when adding new lines
set showcmd         " show previous window command in bottom line
set showmode        " display the current mode
set laststatus=2    " Always display the last status
set mouse=a         " Enable mouse in all 4 modes
set noerrorbells visualbell t_vb= " disable audio/visual messages for failed commands
set wildmenu        " Display menu when autocomplete hase more than 1 possible value
set wildignore+=*.o,*.obj,.git,*.pyc,parts,*.egg-info,node_modules,tmp,venv,build,resources,vendor,tags " list of things to not tab complete
set wildmode=list:longest " Complete files like a shell.
set incsearch       " Highlight matches as you type.
set hlsearch        " Highlight matches.
set ignorecase      " Case-insensitive searching.
set smartcase       " But case-sensitive if expression contains a capital letter.
set lazyredraw      " Only redraw when necessary (makes macros execute faster)
set showmatch       " highlight matching character for [{()}]
set winwidth=84     " when going into a window or split it will then take at least 84 columns of width
set winheight=5     " set winheight low to set winminheight
set winminheight=5  " minimum height allowed for a window
set winheight=999   " active window takes maximum height
set shell=/bin/bash " use the proper path
set scrolloff=3     " Show 3 lines of context around the cursor.
set list listchars=tab:»\ ,trail:· " set characters for trailing white space and <Tab> characters
highlight SpecialKey guifg=#FF003F " set color for hidden characters
" set statusline+=%{synIDattr(synID(line('.'),col('.'),1),'name')} " show kind of token under cursor in status line

set t_Co=256 " Force 256 colors
" in case t_Co alone doesn't work, add this as well:
" i.e. Force 256 colors harder
let &t_AB="\e[48;5;%dm"
let &t_AF="\e[38;5;%dm"

set t_ut= "improve screen clearning by using the background color
set background=dark
colorscheme solarized
set enc=utf-8
set term=screen-256color
let $TERM='screen-256color'

" Don't make a backup before overwriting a file or write swap files
set nobackup
set nowritebackup
set noswapfile

" Natural split movement
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Have CtrlP always open in the current window, turning
" off the default behavior of avoiding windows created
" by another plugin like NERDtree
"
" https://github.com/carlhuda/janus/issues/404
" https://github.com/kien/ctrlp.vim/issues/28
let g:ctrlp_dont_split = 'netrw'

" Avoid concealing JSON syntax (double quotes, etc)
let g:vim_json_syntax_conceal = 0

" Airline Settings
let g:airline_powerline_fonts = 1
let g:airline_left_sep = "\ue0b0"
let g:airline_right_sep = "\ue0b2"

" Split lines (useful for correct spacing in javascript functions
imap <C-c> <CR><Esc>O

" Disable Execute Mode
nmap Q <Nop>

" capture current file path into clipboard
function! CaptureFile()
  let @+ = expand('%')
endfunction
map <leader>f :call CaptureFile()<cr>

" Fix indentation in file
map <leader>i mmgg=G`m<CR>

" Open Buffer explorer
nnoremap ; :BufExplorer<cr>

" Toggle highlighting of search results
nnoremap <leader><space> :nohlsearch<cr>

" Auto-complete
" MULTIPURPOSE TAB KEY (taken from Gary Bernhardt)
" Indent if we're at the beginning of a line. Else, do completion.
function! InsertTabWrapper()
  let col = col('.') - 1
  if !col || getline('.')[col - 1] !~ '\k'
    return "\<tab>"
  else
    return "\<c-p>"
  endif
endfunction
" either tab or smart complete depending on location
inoremap <tab> <c-r>=InsertTabWrapper()<cr>
" open wildmenu with Shift+Tab
inoremap <s-tab> <c-n>

" us 'gp' to open CtrlP since Ctrl + P is slow in docker container
map gp :CtrlP<cr>

" Use The Silver Searcher for CtrlP and vim-ack plugins
let g:ackprg = 'ag --nogroup --nocolor --column'
let g:ctrlp_user_command = 'ag %s -l --nocolor -g "" -U'
let g:ctrlp_cache_dir = $HOME . '/.cache/ctrlp' " Persist the CtrlP cache
let g:ctrlp_use_caching = 1                     " Enable CtrlP caching
let g:ctrlp_match_window = "bottom,order:btt"   " Order file matches from bottom to top
let g:ctrlp_working_path_mode = 0               " Don't change working directory based on current buffer

" Set up filetype specific commands
if has("autocmd")
  " Enable auto-completion
  autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
  autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
  autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS

  " Restore cursor position
  autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif
endif
