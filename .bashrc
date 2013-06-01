export EDITOR=nano

alias rm='rm -i'
alias rmdir='rmdir -i'
alias ref='sudo apt-get update && sudo apt-get upgrade && sudo apt-get dist-upgrade'
alias ss='screenshot'
alias xclip='xclip -selection c'
alias startx='startx -- :1'
alias in='sudo apt-get install'

proc() {
	if [[ -n "$1" ]]; then ps aux | grep $1; else ps aux; fi
}

sprunge() {
	cat $1 | curl -s -F 'sprunge=<-' http://sprunge.us
}

rmr() {
  find . -regex ".*\($1\)$" -exec rm -r {} \;
}

img() {
	curl -s -F "image=@$1" -F "key=b3625162d3418ac51a9ee805b1840452" http://imgur.com/api/upload.xml | grep -E -o "<original_image>(.)*</original_image>" | grep -E -o "http://i.imgur.com/[^<]*"
}

# needs to be improved calling img()
screenshot() {
  scrot -c -d $1 '%Y-%m-%d_%T.png' -e 'curl -s -F "image=@$f" -F "key=b3625162d3418ac51a9ee805b1840452" http://imgur.com/api/upload.xml | grep -E -o "<original_image>(.)*</original_image>" | grep -E -o "http://i.imgur.com/[^<]*" && rm $f'
}

ip() {
	echo `w3m -dump http://checkip.dyndns.org`
}

weather() {
	echo `w3m -dump "http://www.google.com/search?hl=en&lr=&client=firefox-a&rls=org.mozilla%3Aen-US%3Aofficial&q=weather+${1}&btnG=Search" | grep -A 5 -m 1 "Weather for"`
}

word() {
	echo `w3m -dump "http://dictionary.reference.com/browse/${1}" | grep -i -m 1 -w "${2}:" | sed 's/^[ \t]*//;s/[ \t]*$//'`
}

links() {
	curl $1 2>&1 | grep -o -E 'href="([^"#]+)"' | cut -d'"' -f2
}

tor_() {
	sudo systemctl restart tor.service
	GSETTINGS_BACKEND=dconf gsettings set org.gnome.system.proxy mode manual
}

untor_() {
	sudo systemctl stop tor.service
	GSETTINGS_BACKEND=dconf gsettings set org.gnome.system.proxy mode none
}

#PS1='\[\e[34;1m\]\t \[\e[1;31m\]\u\[\e[m\]@\[\e[1;32m\]\h\[\e[m\] \[\e[1;34m\]\w\[\e[m\] \[\e[0;33m\]\$\[\e[m\] '
#PS1="┌─[ \[\e[34;1m\]\t \[\e[1;31m\]\u\[\e[m\]@\[\e[1;32m\]\h\[\e[m\] \[\e[1;34m\]\w\[\e[m\] \[\e[0;33m\]\$\[\e[m\] ]\n└─[ \$> "

#WIL
#bash /home/giovanni/Workspace/Bash/welcome.sh

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
