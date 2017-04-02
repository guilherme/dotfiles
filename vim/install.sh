VIM_FILES_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

ln -sfv "$VIM_FILES_DIR/.vimrc" ~

mkdir -p ~/.vim/bundle/

if [ -d ~/.vim/bundle/Vundle.vim/.git ]; then
  cd ~/.vim/bundle/Vundle.vim && git pull origin master
else
  git clone git@github.com:VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
fi

vim +PluginInstall +qall
