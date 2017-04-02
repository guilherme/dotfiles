#!/usr/bin/env bash
# taken from: https://github.com/webpro/dotfiles/blob/master/install.sh
export DOTFILES_DIR
DOTFILES_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

. "$DOTFILES_DIR/vim/install.sh"
. "$DOTFILES_DIR/brew/install.sh"

