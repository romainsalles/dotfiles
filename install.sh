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


# Postgres
# ==============================================================================
echo "Download and install Postgres from the official website"
echo "Add in the ~/.bash_profile :"
export PATH="$PATH:/Library/PostgreSQL/9.5/bin"
xcode-select --install

# Install Homebrew
# ==============================================================================
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# Git
# ==============================================================================
brew install git
cp .gitconfig ~/.gitconfig
# Git will remember my password for me
git config --global credential.helper osxkeychain
git config --global core.excludesfile ~/.gitignore_global
cp .gitignore_global ~/.gitignore_global
# branch name in terminal
git clone git://github.com/jimeh/git-aware-prompt.git
nvim ~/.bash_profile
export GITAWAREPROMPT=~/Development/dotfiles/plugins/git-aware-prompt
source "${GITAWAREPROMPT}/main.sh"
export PS1="\u@\h \W \[$txtcyn\]\$git_branch\[$txtred\]\$git_dirty\[$txtrst\]\$ "
source ~/.bash_profile

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
echo '[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"' >> ~/.bash_profile
# Install ruby
rvm install ruby-3.0.0
rvm docs generate-ri
# Make sure you have the latest version of RVM
rvm get stable --autolibs=enable --auto-dotfiles
# To see all the versions of Ruby installed via RVM
rvm list rubies
# To use a specific version
rvm use 3.0.0 --default
# To check
ruby -v

brew install node
