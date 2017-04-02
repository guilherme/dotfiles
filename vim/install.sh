VIM_FILES_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

ln -sfv "$VIM_FILES_DIR/.vimrc" ~
mkdir -p ~/.vim/bundle/
git clone git@github.com:VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall
