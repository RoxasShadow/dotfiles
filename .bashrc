export EDITOR=vim
export TERM=xterm-256color
#export LC_ALL=it_IT.UTF-8
#export LANG=it_IT.UTF-8
export HOMEBREW_NO_ANALYTICS=1

alias rm='rm -i'
alias ss='screenshot'
alias xclip='xclip -selection c'
alias deploy='git checkout stable; git smart-pull stable; git checkout staging; git merge --no-ff stable; git push origin staging; git checkout stable;'
alias lol='echo lol'
alias push='push'
alias subl='sublime --project Desktop/bb-nos.sublime-workspace'
alias fix='fix()'
alias nano='vim'

proc() {
  if [[ -n "$1" ]]; then ps aux | grep $1; else ps aux; fi
}

sprunge() {
  cat $1 | curl -s -F 'sprunge=<-' http://sprunge.us
}

screenshot() {
  scrot -c -d $1 '%Y-%m-%d_%T.png'
  screen
}

ip() {
  echo `curl http://checkip.dyndns.org`
}

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting

export PATH="$HOME/.cargo/bin:$PATH"
