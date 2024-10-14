case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
        # We have color support; assume it's compliant with Ecma-48
        # (ISO/IEC-6429). (Lack of such support is extremely rare, and such
        # a case would tend to support setf rather than setaf.)
        color_prompt=yes
    else
	    color_prompt=
    fi
fi

if [ -f /usr/lib/git-core/git-sh-prompt ]; then
    source /usr/lib/git-core/git-sh-prompt
    git_prompt=yes
else
    git_prompt=
fi

if [ "$color_prompt" = yes ]; then
    red=`tput setaf 1`
    green=`tput setaf 2`
    blue=`tput setaf 4`
    bold=`tput bold`
    reset=`tput sgr0`

    if [ "$git_prompt" = yes ]; then
        PS1='${debian_chroot:+($debian_chroot)}${bold}${green}\u@\h${reset}${bold}:${blue}\w${red}$(__git_ps1)${reset}\n\$ '
    else
        PS1='${debian_chroot:+($debian_chroot)}${bold}${green}\u@\h${reset}${bold}:${blue}\w${reset}\n\$ '
    fi
else
    if [ "$git_prompt" = yes ]; then
        PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w$(__git_ps1)\n\$ '
    else
        PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\n\$ '
    fi
fi

unset color_prompt force_color_prompt git_prompt
