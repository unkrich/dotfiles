#!/usr/bin/env bash


###################################
# SETUP CHECKS                    #
###################################

if [ -f ~/.osx-bootstrapped.txt ]; then
  cat << EOF
~/.osx-bootstrapped.txt FOUND!
This laptop has already been bootstrapped
Exiting. No changes were made.
EOF

  exit 0
fi


###################################
# XCODE                           #
###################################

XCODEINSTALLED=`which xcode-select`
if [[ ${XCODEINSTALLED} == "" ]]; then
  echo "Installing Xcode"
  xcode-select --install
fi


###################################
# ZSH                             #
###################################

if [ ! -d ~/.oh-my-zsh ]; then
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
    rm ~/.zshrc
    ln -s $PWD/.zshrc ~/.zshrc
fi
chsh -s /bin/zsh


###################################
# HOMEBREW / LANGUAGES            #
###################################

sh .homebrew
sh .dev


###################################
# NVIM                            #
###################################

mkdir -p ~/.config/nvim/lua
ln -s $PWD/init.lua ~/.config/nvim/init.lua
echo "lua require('init')" >> ~/.config/nvim/init.vim


###################################
# TMUX                            #
###################################

ln -s $PWD/.tmux.conf ~/.tmux.conf


###################################
# MACCOS DEFAULTS                 #
###################################

sh .macos


###################################
# YABAI / SKHD / Spacebar         #
###################################

brew install koekeishiya/formulae/yabai
ln -s $PWD/.yabairc ~/.yabairc
brew services start yabai

brew install koekeishiya/formulae/skhd
ln -s $PWD/.skhdrc ~/.skhdrc
brew services start skhd

brew install cmacrae/formulae/spacebar
defaults write NSGlobalDomain _HIHideMenuBar -bool true
brew services start spacebar

# TODO: Install Chrome Extensions
# Paywall Blocker, 1Pass, React DevTools

# TODO: /box setup
# https://wiki.nikiv.dev/backups/

# TODO: Automatically start tmux on opening terminal (automatically save tmux on exit of terminal?)

echo "Done. Note that some of these changes require a logout/restart to take effect."
touch ~/.osx-bootstrapped.txt
