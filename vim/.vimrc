" set term='builtin_xterm'
syntax enable
set background=dark
set number
set nobackup
set ai
set guifont=monaco:h12
set wildmode=list:longest,full

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
" Vundle stuff
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#rc()

" let Vundle manage Vundle, required
Plugin 'gmarik/vundle'

" Autocompleter
" The following are examples of different formats supported.
" Keep Plugin commands between here and filetype plugin indent on.
" scripts on GitHub repos
Bundle 'altercation/vim-colors-solarized'
let g:solarized_termcolors=256
colorscheme solarized

Bundle 'lukaszkorecki/CoffeeTags'
Plugin 'triglav/vim-visual-increment'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-abolish'
Plugin 'godlygeek/tabular'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'tpope/vim-markdown'
Plugin 'tpope/vim-rails.git'
Plugin 'danro/rename.vim'
Plugin 'airblade/vim-gitgutter'
Plugin 'kchmck/vim-coffee-script'
Plugin 'tpope/vim-rake'
Plugin 'majutsushi/tagbar'
Plugin 'junegunn/fzf'
Plugin 'junegunn/fzf.vim'

" Snippets are separated from the engine. Add this if you want them:
Bundle 'honza/vim-snippets'
Bundle 'vim-ruby/vim-ruby'

" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}

filetype plugin indent on     " required
"

" copy stuff
nmap ,cs :let @+=expand("%")<cr>
nmap ,cl :let @+=expand("%:p")<cr>
set laststatus=2
" vim-visual-increment details
set nrformats=alpha
autocmd BufNewFile,BufReadPost *.md set filetype=markdown

" set foldenable
set foldmethod=indent
set foldlevel=1
" This is useful to copying strings from the file to the search tool
" Based on this - http://peterodding.com/code/vim/profile/autoload/xolox/escape.vim
function! EscapeString (string)
  let string=a:string
  " Escape regex characters
  let string = escape(string, '^$.*\/~[]')
  " Escape the line endings
  let string = substitute(string, '\n', '\\n', 'g')
  return string
endfunction

noremap <Up> <nop>
noremap <Down> <nop>
noremap <Left> <nop>
noremap <Right> <nop>

" netrw configuration
let g:netrw_liststyle=3


" git gutter
let g:gitgutter_max_signs = 1000

map <F2> :mksession! ~/vim_session <cr> " Quick write session with F2
map <F3> :source ~/vim_session <cr>     " And load session with F3
nmap <leader>t :TagbarToggle<CR>

" coffe ctags
let g:tagbar_type_coffee = {
    \ 'ctagstype' : 'coffee',
    \ 'kinds'     : [
        \ 'c:classes',
        \ 'm:methods',
        \ 'f:functions',
        \ 'v:variables',
        \ 'f:fields',
    \ ]
\ }
