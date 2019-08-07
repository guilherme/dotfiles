" set term='builtin_xterm'
syntax enable
set background=dark
set number
set nobackup
set ai
set guifont=monaco:h12
set wildmode=list:longest,full
set incsearch  " search as characters are entered
set cursorline " highlight the line the cursor is on
set lazyredraw " Don't redraw while executing macros (good performance config)
set hlsearch  " highlight matches when searching
set spell spelllang=en_us
set laststatus=2
set foldenable
set foldmethod=syntax
set foldlevel=3

let mapleader = ","
set visualbell t_vb=    " turn off error beep/flash
set novisualbell        " turn off visual bell

set ts=2  " Tabs are 2 spaces
set bs=2  " Backspace over everything in insert mode

set shiftwidth=2  " Tabs under smart indent

" enables clipboard to system
set clipboard=unnamed

set smarttab

" configuring how the characters are going to appear on the list mode
set listchars=eol:$,tab:>-,trail:~,extends:>,precedes:<

" enable list mode
set list

" telling vim to expand tab into spaces
set expandtab

" set the runtime path to include Plug and initialize
call plug#begin('~/.local/share/nvim/plugged')
Plug 'junegunn/vim-plug'
" Autocompleter
" The following are examples of different formats supported.
" Keep Plug commands between here and filetype plugin indent on.
" scripts on GitHub repos
Plug 'altercation/vim-colors-solarized'
Plug 'triglav/vim-visual-increment'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-abolish'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'danro/rename.vim'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'jlanzarotta/bufexplorer'
Plug 'scrooloose/nerdtree'
call plug#end()

let g:solarized_termcolors=256
colorscheme solarized

" copy stuff
nmap ,cs :let @+=expand("%")<cr>
nmap ,cl :let @+=expand("%:p")<cr>

noremap <Up> <nop>
noremap <Down> <nop>
noremap <Left> <nop>
noremap <Right> <nop>

" netrw configuration
let g:netrw_liststyle=3

"""""""""""""""
" JSX syntax highlighting
"""""""""""""""
let g:jsx_ext_required = 0  " Highlight .js as well as .jsx files
let g:ag_prg="rg --vimgrep"

" NERDTree
map <C-n> :NERDTreeFind<CR>
