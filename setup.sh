#!/usr/bin/env bash

if [ -f ~/.osx-bootstrapped.txt ]; then
  cat << EOF
~/.osx-bootstrapped.txt FOUND!
This laptop has already been bootstrapped
Exiting. No changes were made.
EOF

  exit 0
fi

CURRDIR=`pwd`
BREWINSTALLED=`which brew`
XCODEINSTALLED=`which xcode-select`

# Install Xcode
if [[ ${XCODEINSTALLED} == "" ]]; then
  echo "Installing Xcode"
  xcode-select --install
fi

# Install Brew
if [[ ${BREWINSTALLED} == "" ]]; then
  echo "Installing Brew"
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Install zsh and switch shells immediately
brew tap homebrew/cask
brew update
brew install zsh
zsh
echo "export PATH=/opt/homebrew/bin:$PATH" >> ~/.zshrc
source ~/.zshrc 

# Desktop applications
brew install --cask iterm2
brew install --cask google-chrome
brew install --cask notion
brew install --cask slack
brew install --cask discord
brew install --cask spotify
brew install --cask cron
brew install --cask postman
brew install --cask zoom
brew install --cask linear-linear
brew install --cask microsoft-office
brew install --cask ledger-live
brew install --cask kicad
brew install --cask private-internet-access
brew install --cask obs
brew install --cask zappy
brew install --cask muzzle
brew install postgresql
brew install --cask pgadmin4
brew install --cask docker
brew install docker-compose
brew install homebrew/cask-drivers/logitech-options

# Mac App Store - must be logged into Apple account
brew install mas
mas install 967805235 # Paste App - Clipboard Manager

# Unix
brew install universal-ctags/universal-ctags/universal-ctags --HEAD
brew install openssl
brew install rcm # https://thoughtbot.com/upcase/videos/manage-and-share-your-dotfiles-with-rcm
brew install tmux
brew install vim
brew install nvim
brew install watchman # ? Ninja-dev-sync?

# GitHub
brew install git
brew install gh

# Heroku & Parity
brew tap heroku/brew
brew install heroku/brew/heroku
brew unlink heroku
brew link --force heroku
brew tap paritytech/paritytech 
brew install parity

# Programming language prerequisites and package managers
brew install libyaml
brew install coreutils
#? gpg-suite-no-mail ?

# Databases
brew install postgresql # postgres?
brew install redis
brew install sqlite3
# brew install mysql


# Ruby install - Apple silicon
brew install chruby ruby-install
ruby-install ruby
echo "source /opt/homebrew/opt/chruby/share/chruby/chruby.sh" >> ~/.zshrc
echo "source /opt/homebrew/opt/chruby/share/chruby/auto.sh" >> ~/.zshrc
echo "chruby ruby-3.1.2" >> ~/.zshrc
source ~/.zshrc
gem update --system 
gem install rails
gem install bundler

# Node / javascript install
brew install nvm
mkdir ~/.nvm 
export NVM_DIR="~/.nvm"
[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "opt/homebrew/opt/nvm/nvm.sh" # this loads nvm
[ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"
echo "export NVM_DIR='~/.nvm'" >> ~/.zshrc
nvm install node 
brew install yarn

# Java / Clojure install
brew install java
echo 'export PATH="/opt/homebrew/opt/openjdk/bin:$PATH' >> ~/.zshrc
brew install clojure/tools/clojure
brew install leiningen

# Python 2 (weird after Monterey)
brew install pyenv
pyenv install 2.7.18
sudo mkdir -p /usr/local/bin
ln -s "${HOME}/.pyenv/versions/2.7.18/bin/python2.7" "/usr/local/bin/python"

# Python3 (may be installed by default and this may mess things up)
pyenv install 3.9.2
# brew install python
# python3 -m pip install --upgrade setuptools
# python3 -m pip install --upgrade pip
# python3 -m pip install virtualenv

# Rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
echo 'export PATH="$HOME/.cargo/bin:$PATH"' >> ~/.zshrc


# Misc. Dev Tooling
brew install terraform
brew install packer
brew install awscli
brew install ffmpeg

# Misc. CLI Tooling
brew install jq
brew install tree







# Misc. MacOS Setup

# Hide dock and set to left-hand side
osascript -e "tell application \"System Events\" to set the autohide of the dock preferences to true"
osascript -e "tell application \"System Events\" to tell dock preferences to set screen edge to left"
defaults write com.apple.Dock autohide-delay -float 0.0001; killall Dock

# Change pinned apps
brew install --cask hpedrorodrigues/tools/dockutil
dockutil --remove all
dockutil --add /Applications/Google\ Chrome.app/
dockutil --add /System/Applications/Messages.app/
dockutil --add /Applications/Cron.app/
dockutil --add /Applications/Superhuman.app/
dockutil --add /Applications/Zoom.app/
dockutil --add /Applications/Slack.app/
dockutil --add /Applications/Notion.app/
dockutil --add /Applications/iTerm.app/
dockutil --add /System/Applications/Notes.app/
dockutil --add /System/Applications/System\ Preferences.app/

# Keyboard delay / repeat
defaults write -g InitialKeyRepeat -int 10 # normal minimum is 15 (225 ms)
defaults write -g KeyRepeat -int 1 # normal minimum is 2 (30 ms)


if [ ! -d ~/.oh-my-zsh ]; then
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
    rm ~/.zshrc
    ln -s $CURRDIR/zshrc-config ~/.zshrc
fi

touch ~/.osx-bootstrapped.txt
