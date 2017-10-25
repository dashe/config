
# show git info in prompt
# PS1="[\d \t \u@\h:\w ] $ "
# setup PROMPT_COMMAND, which gets run before each prompt is printed
# save the return code for later use in my prompt
# this needs to be at the start of the command, so it needs to be last
# in the list
PROMPT_COMMAND="RET=$?;${PROMPT_COMMAND}"
export PROMPT_COMMAND
 
# setup my PROMPT
if [[ -n "$PS1" ]] ; then
  # setup some useful colors
  export RED="\[\033[0;31m\]"
  export GREEN="\[\033[0;32m\]"
  export YELLOW="\[\033[0;33m\]"
  export CYAN="\[\033[1;36m\]"
  export GRAY="\[\033[0;37m\]"
  export BLUE="\[\033[1;34m\]"
  export NO_COLOR="\[\033[0m\]"
  # generate fields that aren't going to change, so they can be set once
  export YEAR=`date +%Y`
 
  function success-color {
    if [[ $1 -eq 0 ]] ; then
      # GREEN
      echo -ne "\033[0;32m"
    else
      # RED
      echo -ne "\033[0;31m"
    fi
  }
 
  # start with an empty line
  PS1="\n"
 
  # Choose a color based on whether the last command succeeded or not
  PS1="$PS1"'$([[ ${?:-0} -eq 0 ]] && echo "\033[0;32m" || echo "\033[0;31m")'
 
  # add the time, date, user@host and full path
  PS1="$PS1[\t \d $YEAR] $YELLOW\u$NO_COLOR@$BLUE${HOSTNAME%.facebook.com}
  $CYAN\w"
 
  # add the basename, the git branch the history number and the $ symbol
  PS1="$PS1\n\W $GREEN"'$((git branch 2> /dev/null || echo "* unversioned") | grep \'*' | cut -c 3-)'"
  $RED\! $NO_COLOR\$ "
  export PS1
fi


alias aa='vi ~/.bashrc'
alias resource='. ~/.bashrc'

alias h='history'
alias hist='history'

# AMP
alias cda='cd ~/Addepar/AMP'

# Salt
alias cdsa='cd ~/Addepar/salt'

# ember-charts
alias cdec='cd ~/Addepar/ember-charts'

# Iverson / Ember
alias cdi='cd ~/Addepar/Iverson/iverson'
alias runui='cdi && yarn && ember s'
alias eslint='./node_modules/eslint/bin/eslint.js'
alias eslintall='./node_modules/eslint/bin/eslint.js app tests'
alias embertest='ember test --server'
alias embertestnamed='ember test --filter'
alias embertestmodule='ember test --module'
alias eg='ember generate'

# git
alias gpull='git pull'
alias gs='git status'
alias gd='git diff'
alias gdnames='git diff --name-status'
alias gb='git branch'
alias newb='git checkout -b'
alias lb='git checkout -'

alias ga='git add'
alias gaa='git add .'
alias gpush='git push'
alias forcepush='git push -f'

alias gcom='_gcom() { echo ; echo Committing staged changes with following merge comment: ; echo $1 ; echo ; git commit --message="$1" ; echo ; }; _gcom'
alias gaac='_gaac() { echo ; echo Committing all changes with following merge comment: ; echo $1 ; echo ; git add . ; git commit --message="$1" ; echo ; }; _gaac'
alias bang='_bang() { echo ; echo Committing all changes with following merge comment: ; echo $1 ; echo ; git add . ; git commit --message="$1" ; echo ; git push ; echo ; }; _bang'

alias goma='git checkout master'
alias upma='goma ; git pull'
alias greb='git rebase origin/master'
alias gra='git rebase --abort'
alias grc='git rebase --continue'

alias git_cleanup_deleted='git fetch --prune origin'
alias mergeallmasterupdates='git merge origin/master'

alias glo='git log --oneline --decorate'
alias glotop='glo | head'

alias ssv='git stash save'
alias gitpop='git stash pop'
alias stashlist='git stash list'

# navigation & listing
alias ll='ls -lsa'
alias l='ll'

# buck
alias cdb='cd ~/Addepar/buck'
alias bp='./buck project'
alias bt='./buck test' # runs all 'fast' tests
alias bc='./buck clean'
alias buckall='./buck clean && ./buck project'
alias buckjooq='./buck build //infra/service/ampdb:jooq'

alias checkstyle='./buck build //Common:checkstyle ; ./buck build //Server:checkstyle ; ./buck build //rest-api-server:checkstyle'
alias stat='./buck build //Common:static_analysis ; ./buck build //Server:static_analysis ; ./buck build //rest-api-server:static_analysis'
alias findbugs='./buck build //Common:findbugs ; ./buck build //Server:findbugs ; ./buck build //rest-api-server:findbugs'
alias style='checkstyle ; stat ; findbugs'
alias styleq='checkstyle ; stat'

# mysql
alias runsql='mysql.server restart'
alias refreshdb='~/Addepar/AMP/Tools/scripts/fetch_remote_db.sh'
alias refreshdemodb='~/Addepar/AMP/Tools/scripts/fetch_remote_db.sh --use-demo-db'

alias find_lodash_versions='grep --include=\*.json -rnw . -e lodash\"\:'

