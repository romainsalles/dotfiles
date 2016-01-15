#!/bin/sh

# ========================== #
# Install my dev environment #
# ========================== #

# Configure iTerm2
# ==============================================================================
echo "Download iTerm2"
open https://www.iterm2.com/

# Display hidden files in Finder
defaults write com.apple.finder AppleShowAllFiles 1
echo "Puis relancer Finder : Menu Pomme –> Forcer à quitter –> Finder –> Relancer"

# Use Solarized theme
echo "File downloaded at https://github.com/altercation/solarized/tree/master/iterm2-colors-solarized"
echo "Use this Preset : ./Solarized Dark.itermcolors"

# XCode
# ==============================================================================
echo "Start by downloading and installing XCode"
echo "Don't forget to open it to accept the license and install the different components"

# Install Homebrew
# ==============================================================================
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# Git
# ==============================================================================
brew install git
cp .gitconfig ~/.gitconfig
# Git will remember my password for me
git config --global credential.helper osxkeychain

# nvim
# ==============================================================================
brew install neovim/neovim/neovim
mkdir ~/.config/nvim/colors/
cp solarized.vim ~/.config/nvim/colors/
mkdir ~/.config
mkdir ~/.config/nvim
mv init.vim ~/.config/nvim/init.vim
curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
# Dans nvim, executer :PlugInstall
brew install the_silver_searcher

# Rvm & Ruby
# ==============================================================================
# Install rvm
curl -L https://get.rvm.io | bash -s stable --auto-dotfiles --autolibs=enable --rails
source ~/.rvm/scripts/rvm
# Install ruby
rvm install ruby-2.3.0
rvm docs generate-ri
# Make sure you have the latest version of RVM
rvm get stable --autolibs=enable --auto-dotfiles
# To see all the versions of Ruby installed via RVM
rvm list rubies
# To use a specific version
rvm use 2.3.0 --default
# To check
ruby -v
