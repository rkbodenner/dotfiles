function get_git_branch() {
  branchname=$(git status -s -b -u no 2> /dev/null || echo '' | head -1)
  echo ${branchname#### }
}
export PS1='[$(get_git_branch)] \h:\W  '

alias pico=nano
alias subl='/Applications/Sublime\ Text\ 2.app/Contents/SharedSupport/bin/subl'
export SVN_EDITOR=pico
export GIT_EDITOR=pico
export EDITOR=emacs
export ACK_PAGER='less -R'

# Append my path to the system path
export PATH=
eval `/usr/libexec/path_helper -s`
# Hack: Put /usr/local/bin first so we can use homebrew-installed PostgreSQL
export PATH=/usr/local/bin:$PATH:/usr/local/sbin:/usr/local/mysql/bin:$HOME/bin:/usr/local/sphinx/bin

export DYLD_LIBRARY_PATH="/usr/local/mysql/lib"

alias ls='ls -G'
alias ll='ls -l'
alias la='ls -a'
alias lla='ls -la'
alias beep='printf "\a"'

# poor man's ack
alias grep_all='find . -name "*" -not -path "*/.git/*" -not -path "*/.svn/*" -print | sed -E -e ''s/\(.*\)/\"\\1\"/'' | xargs grep'
alias grep_rb='find . -name "*.rb" -not -path "*/vendor/*" -not -path "*/test/*" -not -path "*/.git/*" -not -path "*/.svn/*" -print | sed -E -e ''s/\(.*\)/\"\\1\"/'' | xargs grep'

alias img='open -a Preview'

alias pg='pg_ctl -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log start'

alias migrate='env RAILS_ENV=development bundle exec rake db:migrate && env RAILS_ENV=test bundle exec rake db:migrate'
alias gemserver='gem server 2&>1 > /dev/null &'
alias gits='git status'
alias gsl='git stash list'
alias shove='git pull && git push origin master'

# [[ -s $HOME/.rvm/scripts/rvm ]] && source $HOME/.rvm/scripts/rvm

if [ -f ~/.bash/newrelic ]; then
  source ~/.bash/newrelic
fi

export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"
