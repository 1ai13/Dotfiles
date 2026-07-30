#
# ~/.bashrc
#

[[ $- == *i* ]] && source /usr/share/blesh/ble.sh --noattach

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

export PATH="$HOME/Dev/bin:$PATH"

#Promt customization
export PS1='\[\e[1;36m\]\u\[\e[33m\] | \[\e[1;32m\]\W\[\e[1;33m\] ➤\[\e[0m\] '
export PS2='\[\e[1;32m\] → \[\e[0m\] '

complete -cf sudo

#Basic alias
alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias projgen='project_generator'

gcpush(){
  while true; do
    read -p "Commit message: " msg 
    [[ -n "$msg" ]] && break
    echo "Message can't be empty"
  done
  git add .
  git commit -m "$msg"
  git push
}

#CMAKE commands
alias cmcd='cmake -S . -B build/debug -G Ninja -DCMAKE_BUILD_TYPE=Debug'
alias cmcr='cmake -S . -B build/release -G Ninja -DCMAKE_BUILD_TYPE=Release'
alias cmcl='ninja -C build -t clean'
cmcfg(){
  cmcd
  cmcr
}

#Helpers
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

qn(){
  [[ -z "$1" ]] && quit "No quick notes provided"

  [[ ! -f "$HOME/Documents/quick_notes.txt" ]] && echo -e "Notes file not found...\nCreating file at ~/Documents/quick_notes.txt"

  echo -e "$1\n------------------------------------\n" >> $HOME/Documents/quick_notes.txt
}

[[ ${BLE_VERSION-} ]] && ble-attach
