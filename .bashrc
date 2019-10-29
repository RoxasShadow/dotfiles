export EDITOR=vim
export TERM=xterm-256color
#export LC_ALL=it_IT.UTF-8
#export LANG=it_IT.UTF-8
export HOMEBREW_NO_ANALYTICS=1

alias ss='screenshot'
alias xclip='xclip -selection c'
alias lol='echo lol'
alias nano='vim'

alias vim="nvim"
alias vi="nvim"
alias oldvim="vim"
alias pip="pip3"

alias rm='rm -i'
alias rmdir='rmdir -i'

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
