#!/usr/bin/env bash
# taken from: https://github.com/webpro/dotfiles/blob/master/install.sh
export DOTFILES_DIR EXTRA_DIR
DOTFILES_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
EXTRA_DIR="$HOME/.extra"

ln -sfv "$DOTFILES_DIR/vim/.vimrc" ~
vim +PluginInstall +qall
