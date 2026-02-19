#
# ~/.bashrc
#

[[ $- == *i* ]] && source /usr/share/blesh/ble.sh --noattach

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'

PS1='\[\e[1;36m\]\u\[\e[33m\] | \[\e[1;32m\]\W\[\e[1;33m\] ➤\[\e[0m\] '
PS2='\[\e[1;32m\] → \[\e[0m\] '

complete -cf sudo


whatsize(){
    du -h --max-depth=1 --exclude=/{proc,sys,dev,run} -t 1 ${1:-/} 2>/dev/null | sort -hr
}

function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	command yazi "$@" --cwd-file="$tmp"
	IFS= read -r -d '' cwd < "$tmp"
	[ "$cwd" != "$PWD" ] && [ -d "$cwd" ] && builtin cd -- "$cwd"
	rm -f -- "$tmp"
}

[[ ${BLE_VERSION-} ]] && ble-attach
