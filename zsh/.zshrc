## ALIASES ##
alias g="git"

## ZSH SETUP ##
export ZSH=$HOME/.oh-my-zsh
ZSH_THEME="robbyrussell"
plugins=(git)

source $ZSH/oh-my-zsh.sh

# Necessary for correct tmux input
export TERM=xterm

# Homebrew
export PATH="/opt/homebrew/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:$PATH"

# OpenSSL
export LDFLAGS="-L/opt/homebrew/opt/openssl@3/lib"
export CPPFLAGS="-I/opt/homebrew/opt/openssl@3/include"

# Ruby
# source /opt/homebrew/opt/chruby/share/chruby/auto.sh
# source /opt/homebrew/opt/chruby/share/chruby/chruby.sh
# chruby ruby-3.1.2

# Java
export PATH="/opt/homebrew/opt/openjdk/bin:$PATH"

# nvm
export NVM_DIR="$HOME/.nvm"
  [ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

export NODE_OPTIONS=--openssl-legacy-provider

# Cargo
export PATH="$HOME/.cargo/bin:$PATH"

# direnv
eval "$(direnv hook zsh)"

# Start SSH Agent
#----------------------------

SSH_ENV="$HOME/.ssh/environment"

function run_ssh_env {
  . "${SSH_ENV}" > /dev/null
}

function start_ssh_agent {
  echo "Initializing new SSH agent..."
  ssh-agent | sed 's/^echo/#echo/' > "${SSH_ENV}"
  echo "succeeded"
  chmod 600 "${SSH_ENV}"

  run_ssh_env;

  ssh-add ~/.ssh/id_rsa;
}

if [ -f "${SSH_ENV}" ]; then
  run_ssh_env;
  ps -ef | grep ${SSH_AGENT_PID} | grep ssh-agent$ > /dev/null || {
    start_ssh_agent;
  }
else
  start_ssh_agent;
fi

eval $(thefuck --alias)

# Add custom bin scripts
export PATH=~/bin:$PATH
