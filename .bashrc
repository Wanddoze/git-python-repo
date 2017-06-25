# .bashrc

# User specific aliases and functions

alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

RCol="\[\e[m\]"
Red="\[\e[;31m\]"
Cya="\[\e[;36m\]"
Gre="\[\e[;32m\]"
current_branch()
{
    BRANCH="`git branch 2>/dev/null | grep \* | cut -c3-`"
    [ "${BRANCH:0:1}" = "(" ] && BRANCH="${BRANCH:1:${#BRANCH}-2}"
    STATUS="`git status --porcelain 2>/dev/null`"
    if [ ${#BRANCH} -gt 0 ]
    then
        [ ${#STATUS} -gt 0 ] && BRANCH="${1}${BRANCH}${3}"
        [ ${#BRANCH} -gt 0 ] && BRANCH="${2}${BRANCH}${3}"
        printf " (${BRANCH})"
    fi
}

# Uncomment the following line if you don't like systemctl's auto-paging feature:

# User specific aliases and functions
alias such=git
alias very=git
alias much=git
alias wow='git status'
alias gev=git
alias pronto='gev pull && gev push'
export PS1="[${Cya}\u@\h${RCol}:\w\$(current_branch '${Red}' '${Gre}' '${RCol}')] "
export PATH="${PATH}:/usr/local/bin"
