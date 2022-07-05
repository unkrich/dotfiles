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

CURRDIR=`pwd`
BREWINSTALLED=`which brew`
XCODEINSTALLED=`which xcode-select`


###################################
# XCODE                           #
###################################

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
    ln -s $CURRDIR/zshrc-config ~/.zshrc
fi
zsh
# TODO: ZSH theme install


###################################
# HOMEBREW / APPS                 #
###################################

if [[ ${BREWINSTALLED} == "" ]]; then
  echo "Installing homebrew and applications"
  sh .homebrew
  sh .dev
fi


###################################
# MACCOS DEFAULTS                 #
###################################

sh .macos

# TODO: sh git.sh

# TODO: Install Chrome Extensions
# Paywall Blocker, 1Pass, React DevTools

# TODO: Copy and setup dotfiles
# tmux, nvim, zshrc

# TODO: Yabai, skhd

# TODO: /box setup
# https://wiki.nikiv.dev/backups/

# TODO: Automatically start tmux on opening terminal (automatically save tmux on exit of terminal?)


###############################################################################
# Kill affected applications                                                  #
###############################################################################

# TODO: Update list
for app in "Activity Monitor" \
	"Dock" \
	"Finder" \
	"Google Chrome" \
	"Messages" \
	"Photos" \
	"Twitter" \
	"iCal"; do
	killall "${app}" &> /dev/null
done
echo "Done. Note that some of these changes require a logout/restart to take effect."

touch ~/.osx-bootstrapped.txt
