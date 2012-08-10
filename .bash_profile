function get_git_branch() {
  branchname=$(git status -s -b -u no 2> /dev/null || echo '' | head -1)
  echo ${branchname#### }
}
export PS1='[$(get_git_branch)] \h:\W  '

alias pico=nano
export SVN_EDITOR=pico
export GIT_EDITOR=pico
export EDITOR=emacs
export ACK_PAGER='less -R'

# Append my path to the system path
export PATH=
eval `/usr/libexec/path_helper -s`
export PATH=$PATH:/usr/local/sbin:/usr/local/mysql/bin:$HOME/bin:/usr/local/sphinx/bin

alias ls='ls -G'
alias ll='ls -l'
alias la='ls -a'
alias lla='ls -la'
alias beep='printf "\a"'

# poor man's ack
alias grep_all='find . -name "*" -not -path "*/.git/*" -not -path "*/.svn/*" -print | sed -E -e ''s/\(.*\)/\"\\1\"/'' | xargs grep'
alias grep_rb='find . -name "*.rb" -not -path "*/vendor/*" -not -path "*/test/*" -not -path "*/.git/*" -not -path "*/.svn/*" -print | sed -E -e ''s/\(.*\)/\"\\1\"/'' | xargs grep'

alias img='open -a Preview'

alias migrate='env RAILS_ENV=development rake db:migrate && env RAILS_ENV=test rake db:migrate'
alias gemserver='gem server 2&>1 > /dev/null &'
alias gits='git status'
alias gsl='git stash list'
alias shove='git pull && git push origin master'

[[ -s $HOME/.rvm/scripts/rvm ]] && source $HOME/.rvm/scripts/rvm

if [ -f ~/.bash/newrelic ]; then
  source ~/.bash/newrelic
fi
