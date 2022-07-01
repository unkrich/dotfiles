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

# Hide dock and set to left-hand side
osascript -e "tell application \"System Events\" to tell dock preferences to set screen edge to left"

# Remove the auto-hiding Dock delay
defaults write com.apple.Dock autohide-delay -float 0.0001; killall Dock
# Remove the animation when hiding/showing the Dock
defaults write com.apple.dock autohide-time-modifier -float 0
# Automatically hide and show the Dock
defaults write com.apple.dock autohide -bool true

# Don’t show recent applications in Dock
defaults write com.apple.dock show-recents -bool false

# Set the icon size of Dock items to 30 pixels
defaults write com.apple.dock tilesize -int 30

# Speed up Mission Control animations
defaults write com.apple.dock expose-animation-duration -float 0.1
