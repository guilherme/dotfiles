#!/usr/bin/env bash
# taken from: https://github.com/webpro/dotfiles/blob/master/install.sh
export DOTFILES_DIR
DOTFILES_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

. "$DOTFILES_DIR/brew/install.sh"

mkdir -p ~/.config/nvim/
ln -s $(pwd)/vim/.vimrc ~/.config/nvim/init.vim
