ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew tap homebrew/versions
brew tap homebrew/dupes
brew tap caskroom/cask
brew tap homebrew/core
brew tap homebrew/services
brew tap neovim/neovim
brew tap sebglazebrook/aliases
brew tap sebglazebrook/infinite-pipe
brew update
brew upgrade

brew install git imagemagick jq rust wget htop coreutils ripgrep watch gdb aliases infinite-pipe neovim/neovim/neovim
brew install --cask rectangle
