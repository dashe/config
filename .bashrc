
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

# AMP
alias cda='cd ~/Addepar/AMP'

# Iverson / Ember
alias cdi='cd ~/Addepar/Iverson'
alias runui='cdi && yarn && ember s'

# buck
alias cdb='cd ~/Addepar/buck'

# git
alias gpull='git pull'
alias gs='git status'
alias gd='git diff'
alias gb='git branch'
alias newb='git checkout -b'
alias lb='git checkout -'

alias ga='git add'
alias gaa='git add .'
alias gcom='git commit'
alias gaac='git commit -a'
alias gpush='git push'
alias forcepush='git push -f'

alias goma='git checkout master'
alias upma='goma ; git pull'
alias greb='git rebase origin/master'

alias git_cleanup_deleted='git fetch --prune origin'

# navigation & listing
alias ll='ls -lsa'
alias l='ll'

# build tools
alias bp='buck project'
alias bt='buck test' # runs all 'fast' tests
alias bc='buck clean'

alias style='buck build //Server:static_analysis ; buck build //Common:static_analysis'
alias findbugs='buck build //Server:findbugs ; buck build //Common:findbugs'

# mysql
alias runsql='mysqld'
alias refreshdb='~/Addepar/AMP/Tools/scripts/fetch_remote_db.sh'

