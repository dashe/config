#! /bin/bash

if [ -r ~/.profile ]; then . ~/.profile; fi
case "$-" in *i*) if [ -r ~/.bashrc ]; then . ~/.bashrc; fi;; esac

export PATH="~/Addepar/buck/bin:$PATH"
export PATH="/usr/local/Cellar/mysql55/5.5.56/bin:$PATH"

source ~/Addepar/buck/scripts/buck-completion.bash
source ~/git-completion.bash

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh" # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

