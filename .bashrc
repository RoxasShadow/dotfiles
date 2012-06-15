export EDITOR=vim
#export DEVKITPRO=/opt/devkitpro
#export DEVKITPPC=$DEVKITPRO/devkitPPC
#export WIILOAD=tcp:192.168.1.92

alias rm='rm -i'
alias rmdir='rmdir -i'
alias ref='sudo yum upgrade'
alias ss='screenshot'

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
	GSETTINGS_BACKEND=dconf gsettings set org.gnome.system.proxy mode manual
}

untor_() {
	GSETTINGS_BACKEND=dconf gsettings set org.gnome.system.proxy mode none
}

#PS1='\[\e[34;1m\]\t \[\e[1;31m\]\u\[\e[m\]@\[\e[1;32m\]\h\[\e[m\] \[\e[1;34m\]\w\[\e[m\] \[\e[0;33m\]\$\[\e[m\] '
#PS1="┌─[ \[\e[34;1m\]\t \[\e[1;31m\]\u\[\e[m\]@\[\e[1;32m\]\h\[\e[m\] \[\e[1;34m\]\w\[\e[m\] \[\e[0;33m\]\$\[\e[m\] ]\n└─[ \$> "

WIL
bash /home/giovanni/Workspace/Bash/welcome.sh
