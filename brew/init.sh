# Install Brew
if [[ ${BREWINSTALLED} == "" ]]; then
  echo "Installing Brew"
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi
brew tap homebrew/cask
brew update

echo "export PATH=/opt/homebrew/bin:$PATH" >> ~/.zshrc
source ~/.zshrc 

sh apps.sh
sh unix.sh
sh dev.sh
