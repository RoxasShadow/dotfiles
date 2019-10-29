# ~/.oh-my-zsh/oh-my-zsh.sh

#if [[ $ZSH_DISABLE_COMPFIX != true ]]; then
#  source $ZSH/lib/compfix.zsh
#  # If completion insecurities exist, warn the user
#  handle_completion_insecurities
#  # Load only from secure directories
#  compinit -i -C -d "${ZSH_COMPDUMP}"
#else
#  # If the user wants it, load from all found directories
#  compinit -u -C -d "${ZSH_COMPDUMP}"
#fi

_zpcompinit_custom() {
  setopt extendedglob local_options
  autoload -Uz compinit
  local zcd=${ZDOTDIR:-$HOME}/.zcompdump
  local zcdc="$zcd.zwc"
  # Compile the completion dump to increase startup speed, if dump is newer or doesn't exist,
  # in the background as this is doesn't affect the current session
  if [[ -f "$zcd"(#qN.m+1) ]]; then
        compinit -i -d "$zcd"
        { rm -f "$zcdc" && zcompile "$zcd" } &!
  else
        compinit -C -d "$zcd"
        { [[ ! -f "$zcdc" || "$zcd" -nt "$zcdc" ]] && rm -f "$zcdc" && zcompile "$zcd" } &!
  fi
}
_zpcompinit_custom

