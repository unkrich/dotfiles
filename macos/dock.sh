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
osascript -e "tell application \"System Events\" to set the autohide of the dock preferences to true"
osascript -e "tell application \"System Events\" to tell dock preferences to set screen edge to left"
defaults write com.apple.Dock autohide-delay -float 0.0001; killall Dock
