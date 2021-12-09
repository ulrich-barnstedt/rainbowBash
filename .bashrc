# Prompt related

FREQUENCY=0.3
PS1="[\u@\h \s]"

if [ "$TERM" = "xterm-256color" ]; then
    PS1=$(echo ${PS1@P} | lolcat -f -t -F ${FREQUENCY} | sed -r 's/[\x1b]\[[0-9]+;[0-9]+;[0-9]+;[0-9]+;[0-9]+[a-z]|\x1b\[[0-9]+[a-z]/\\\[&\\\]/g')
    export PS1="\[\033[38;5;247m\]\A\[$(tput sgr0)\] ${PS1} \[$(tput sgr0)\]\[\033[38;5;12m\]\w\[$(tput sgr0)\] \[$(tput sgr0)\]\[\033[38;5;14m\]*\\$\[$(tput sgr0)\] \[$(tput sgr0)\]"
else
    PS1=$(echo ${PS1@P})
    export PS1="\A ${PS1} \w *\$ "
fi
