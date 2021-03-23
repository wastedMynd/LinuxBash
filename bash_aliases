# bash aliases
alias r=". ~/.bashrc"

#lookup wlan ip adress 
alias wan_add=' ifconfig | grep -n -m 3 -P "inet" | grep -oP  "(\d{3}[.])+\d{3}" | grep -m 1 -oP "(\d{3}[.])+\d{3}" '
