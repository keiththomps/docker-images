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
Plugin 'tpope/vim-fugitive'
Plugin 'scrooloose/syntastic'
Plugin 'tomtom/tcomment_vim'
Plugin 'kien/ctrlp.vim.git'
Plugin 'jlanzarotta/bufexplorer'
Plugin 'rstacruz/sparkup'
Plugin 'bling/vim-airline'

" install theme
Plugin 'chriskempson/base16-vim'

" All plugins are loaded, stop Vundle
call vundle#end()         " required
filetype plugin indent on " required
syntax enable
set number

" Map jj to ESC when in insert mode
inoremap jj <esc>

" Have CtrlP always open in the current window, turning
" off the default behavior of avoiding windows created
" by another plugin like NERDtree
"
" https://github.com/carlhuda/janus/issues/404
" https://github.com/kien/ctrlp.vim/issues/28
let g:ctrlp_dont_split = 'netrw'

" Avoid concealing JSON syntax (double quotes, etc)
let g:vim_json_syntax_conceal = 0

filetype off

" Turn on syntax highlighting.
syntax enable
" Turn on file type detection.
filetype plugin indent on

" Display incomplete commands.
set showcmd
" Display the mode you're in.
set showmode

" Intuitive backspacing.
set backspace=indent,eol,start

" Handle multiple buffers better.
set hidden

" Enhanced command line completion.
set wildmenu
" Complete files like a shell.
set wildmode=list:longest

" Show line numbers.
set number
" Show cursor position.
set ruler

" Highlight matches as you type.
set incsearch
" Highlight matches.
set hlsearch
" Case-insensitive searching.
set ignorecase
" But case-sensitive if expression contains a capital letter.
set smartcase

" Turn on line wrapping.
set wrap
" Show 3 lines of context around the cursor.
set scrolloff=3

" Set the terminal's title
set title

" No beeping.
set visualbell

" Don't make a backup before overwriting a file or write swap files
set nobackup
set nowritebackup
set noswapfile

" Global tab width.
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab

" Show the status line all the time
set laststatus=2

set t_Co=256 " Force 256 colors
" in case t_Co alone doesn't work, add this as well:
" i.e. Force 256 colors harder
let &t_AB="\e[48;5;%dm"
let &t_AF="\e[38;5;%dm"

let base16colorspace=256  " Access colors present in 256 colorspace
set t_ut= "improve screen clearning by using the background color
set background=dark
colorscheme base16-ocean
set enc=utf-8
set term=screen-256color
let $TERM='screen-256color'

" Set to show invisibles (tabs & trailing spaces) & their highlight color
set list listchars=tab:»\ ,trail:·

" Airline Settings
let g:airline_powerline_fonts = 1
let g:airline_left_sep = "\ue0b0"
let g:airline_right_sep = "\ue0b2"

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
