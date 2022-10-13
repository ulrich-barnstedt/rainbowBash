FREQUENCY=0.5
NF_INSTALLED=true

TTY=$(tty | tr -d /dev/pts/)
JOBS='$([ \j -gt 0 ] && echo "[\j] ")';
if [ "$NF_INSTALLED" = true ]; then
    PS1=$'[\xee\xae\x99 \u \xee\x98\xa1 \xef\x84\x89 \h \xee\x98\xa1 \xee\xaf\x8a ${TTY}]'
else
    PS1=$'[\u | \h | \s/${TTY}]'
fi

if [ "$TERM" = "xterm-256color" ] || [ "$TERM" = "alacritty" ]; then
    PS1=$(echo ${PS1@P} | lolcat -f -t -F ${FREQUENCY} | sed -r 's/[\x1b]\[[0-9]+;[0-9]+;[0-9]+;[0-9]+;[0-9]+[a-z]|\x1b\[[0-9]+[a-z]/\\\[&\\\]/g')
    export PS1="${JOBS}\[\033[38;5;247m\]\A\[$(tput sgr0)\] ${PS1} \[$(tput sgr0)\]\[\033[38;5;12m\]\w\[$(tput sgr0)\] \[$(tput sgr0)\]\[\033[38;5;14m\]*\\$\[$(tput sgr0)\] \[$(tput sgr0)\]"
else
    PS1=$(echo ${PS1@P})
    export PS1="${JOBS}\A ${PS1} \w *\$ "
fi

