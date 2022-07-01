# Show the ~/Library folder by default in finder
chflags nohidden ~/Library

#  Preferences → show filename extensions
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

# Enable showing dotfiles (just hold Cmd + Shift + . (dot) in a Finder window)
defaults write -g AppleShowAllFiles -bool true

# Show full path in Finder
defaults write com.apple.finder _FXShowPosixPathInTitle -bool true; killall Finder

# TODO: Show path bar in footer for easier navigation 
# TODO: Customize toolbar to remove extra icons
# TODO: Prune the excessive sidebar bookmarks
# TODO: create “box” folder and pin it
