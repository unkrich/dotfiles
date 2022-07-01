## GitHub ##
brew install git
brew install gh

## Heroku & Parity ##
brew tap heroku/brew
brew install heroku/brew/heroku
brew unlink heroku
brew link --force heroku

# Misc. Dev Tooling
brew install terraform
brew install packer
brew install awscli
brew install ffmpeg

# Programming language prerequisites and package managers
brew install libyaml
brew install coreutils
#? gpg-suite-no-mail ?

# Databases
brew install postgresql # postgres?
brew install redis
brew install sqlite3
brew install mysql

# Ruby install - Apple Silicon
brew install chruby ruby-install
ruby-install ruby
echo "source /opt/homebrew/opt/chruby/share/chruby/chruby.sh" >> ~/.zshrc
echo "source /opt/homebrew/opt/chruby/share/chruby/auto.sh" >> ~/.zshrc
echo "chruby ruby-3.1.2" >> ~/.zshrc
source ~/.zshrc
gem update --system 
gem install rails
gem install bundler

# Node / JavaScript Install
brew install nvm
mkdir ~/.nvm 
export NVM_DIR="~/.nvm"
[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "opt/homebrew/opt/nvm/nvm.sh" # this loads nvm
[ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"
echo "export NVM_DIR='~/.nvm'" >> ~/.zshrc
nvm install node 
brew install yarn

# Crypto
brew tap paritytech/paritytech 
brew install parity
npm install -g truffle

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

# Netlify
npm install netlify-cli -g
