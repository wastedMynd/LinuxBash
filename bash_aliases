#lookup wlan ip adress 
alias wan_add=' ifconfig | grep -n -m 3 -P "inet" | grep -oP  "(\d{3}[.])+\d{3}" | grep -m 1 -oP "(\d{3}[.])+\d{3}" '

# system
alias pd='pushd'
alias PD='popd'

# Folder aliases
alias des='pd ~/Desktop'
alias doc='pd ~/Documents'
alias dow='pd ~/Downloads'
alias mus='pd ~/Music'
alias pic='pd ~/Pictures'
alias pub='pd ~/Public'
alias tem='pd ~/Templates'
alias vid='pd ~/Videos'

# git aliases
alias g='git'
alias g_='g status'
alias gc='g commit -m '
alias ga='g add '
alias gA='g add .'
alias gt='g tag '
alias gp='g push'
alias gP='g pull '

modified=$(g_ | grep -m 1 -oP "modified:(\s+\w+)")
last_tag=$(gt | sed -n '$p')

alias g-='gA && gc "$last_tag:$modified, $1" && echo -e "last tag: $last_tag" '
alias g+='gt $1 && gp'

# bash
alias r='. ~/.bashrc'
alias w='which'
alias m='man'
alias brn='nano -l ~/.bashrc'
alias ban='nano -l ~/.bash_aliases' 
alias br='vim -o ~/.bashrc'
alias ba='vim -o ~/.bash_aliases' 


# apt
alias xudo='sudo'
alias xapt='sudo apt install -yf '

# python3 aliases
alias py3='python3'
alias py3u='py3 -m unittest '
alias pyt='pytest '
alias pv='source venv/bin/activate'

# pywal
alias cw='py3 -m pywal -i'

# screenshot
alias x='import'
 
# Open Nano with line numbers
alias nano='nano -l'

# alias for clear terminal, using dos cls
alias cl='clear'
alias ch='cl && history -c && cl'

# Programs aliases
