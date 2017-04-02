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
Plugin 'marijnh/tern_for_vim'
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

" Snippets are separated from the engine. Add this if you want them:
Bundle 'honza/vim-snippets'
Bundle 'vim-ruby/vim-ruby'


" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" scripts from http://vim-scripts.org/vim/scripts.html
Plugin 'L9'
Plugin 'FuzzyFinder'
" scripts not on GitHub
Plugin 'git://git.wincent.com/command-t.git'


filetype plugin indent on     " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList          - list configured plugins
" :PluginInstall(!)    - install (update) plugins
" :PluginSearch(!) foo - search (or refresh cache first) for foo
" :PluginClean(!)      - confirm (or auto-approve) removal of unused plugins
"
" see :h vundle for more details or wiki for FAQ
" NOTE: comments after Plugin commands are not allowed.
" Put your stuff after this line



" Auto compile CoffeeScript
" let coffee_make_options = '-p'
" let coffee_compiler = 'coffee'
" autocmd QuickFixCmdPost * nested cwindow | redraw!
" autocmd BufWritePost *.coffee silent make!
" autocmd BufNewFile,BufReadPost *.coffee setl foldmethod=indent nofoldenable
" autocmd BufNewFile,BufReadPost *.coffee setl shiftwidth=2 expandtab

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

" Get the current visual block for search and replaces
" This function passed the visual block through a string escape function
" Based on this - http://stackoverflow.com/questions/676600/vim-replace-selected-text/677918#677918
function! GetVisual() range
  " Save the current register and clipboard
  let reg_save = getreg('"')
  let regtype_save = getregtype('"')
  let cb_save = &clipboard
  set clipboard&

  " Put the current visual selection in the " register
  normal! ""gvy
  let selection = getreg('"')

  " Put the saved registers and clipboards back
  call setreg('"', reg_save, regtype_save)
  let &clipboard = cb_save

  "Escape any special characters in the selection
  let escaped_selection = EscapeString(selection)

  return escaped_selection
endfunction

" Start the find and replace command across the entire file
vmap <leader>z <Esc>:%s/<c-r>=GetVisual()<cr>/



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
