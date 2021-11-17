# Prompt related

FREQUENCY=0.3
PS1="[\u@\h \s]"
PS1=$(echo ${PS1@P} | lolcat -f -t -F ${FREQUENCY} | sed -r 's/[\x1b]\[[0-9]+;[0-9]+;[0-9]+;[0-9]+;[0-9]+[a-z]|\x1b\[[0-9]+[a-z]/\\\[&\\\]/g')
export PS1="\[\033[38;5;247m\]\A\[$(tput sgr0)\] ${PS1} \[$(tput sgr0)\]\[\033[38;5;12m\]\w\[$(tput sgr0)\] \[$(tput sgr0)\]\[\033[38;5;14m\]*\\$\[$(tput sgr0)\] \[$(tput sgr0)\]"
