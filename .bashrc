# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
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

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# df -hTP /
# du -hscx /

agent() {
    eval "$(ssh-agent -s)" ssh-add /mnt/c/Users/michael/.ssh/pmp@azure-without-passphrase-id-rsa '/mnt/c/Program Files/putty/keys-pairs/rhel810/id_rsa'
#if [ -z "$SSH_AUTH_SOCK" ] ; then
#    eval `ssh-agent -s`
#    ssh-add /mnt/c/Users/michael/.ssh/pmp@azure-without-passphrase-id-rsa
#fi
}

#agent() {
#line=$(ps aux | grep -v grep | grep ssh-agent)
#if [ -z "$line" ]
#then
#    echo "ssh-agent Not Running"
#    eval `ssh-agent -s`
#    #ssh-add ~michael/.ssh/id_rsa
#    ssh-add /mnt/c/Users/michael/.ssh/pmp@azure-without-passphrase-id-rsa
#else
#    echo $line > /dev/null
#    echo "ssh-agent Running"
#fi
#}
# agent

StartHtmux() {
    tmux new -d -s S1
    tmux select-pane -t 1 -T Main
    tmux split-window -h
    tmux select-pane -t 2 -T W2
    tmux splitw
    tmux select-pane -t 3 -T W3
    tmux splitw
    tmux select-pane -t 4 -T W4
    tmux set -g pane-border-status bottom
}


Starttmux() {
#for S in S1 S2
for S in S1
do
    tmux new -d -s $S
    tmux select-pane -t 1 -T Main
    tmux splitw
    tmux select-pane -t 2
    tmux split-window -h
    tmux select-pane -t 3
    tmux split-window -h
    tmux select-pane -t 1 -T Main
    tmux select-pane -t 2 -T podman-ps
    tmux select-pane -t 3 -T podman-ps-a
    tmux select-pane -t 4 -T podman-images
    tmux select-pane -t 1
    tmux send-keys -t 1 'echo "Hello"' C-m
    tmux set -g pane-border-status bottom
    tmux set -g status-right '#{forecast} | #H'
    tmux set -g @forecast-locatin Singapore
# tmux send-keys -t 2 'podman ps -w 2' C-m
# podman ps -w 2 --format "table {{.ID}}\t{{.Image}}\t{{.Status}}"
# tmux send-keys -t 3 'podman ps -a -w 2' C-m
# podman ps -a -w 2 --format "table {{.ID}}\t{{.Image}}\t{{.Status}}"
# tmux send-keys -t 4 'watch -n 2 podman images' C-m
# watch -n 2 'podman image list --format "table {{.ID}}\t{{.Repository}}\t{{.Tag}}\t{{.Size}}"'
done
tmux kill-sesson -t S2
tmux ls
}

Starttmux2() {
echo 2 TMUX windows
# echo Number of Window # read # Windows
read -p "How many Window? " my_var
tmuxstart() {
tmux new-session -d -s $1 >/dev/null
tmux rename-window -t $1:0 'main'
tmux splitw -v -p 10 -t $1:0.0
tmux splitw -h -p 80 -t $1:0.1
#required; otherwise pane numbering is bs
# Michael
tmux set -g pane-border-status bottom
# Michael
tmux select-pane -t $1:0.0
tmux splitw -h -p 5 -t $1:0.0
tmux send-keys -t $1:0.2 'sudo htop' Enter
tmux send-keys -t $1:0.1 'tmux clock -t $1:0.1' Enter
tmux select-pane -t $1:0.0
tmux new-window -t $1
tmux rename-window -t $1:1 'second'
tmux splitw -v -p 10 -t $1:1.0
tmux splitw -h -p 80 -t $1:1.1
tmux select-pane -t $1:1.0
tmux splitw -h -p 5 -t $1:1.0
tmux clock -t $1:1.1
tmux new-window -t $1
tmux rename-window -t $1:2 'scratch'
tmux splitw -v -p 10 -t $1:2.0
tmux select-pane -t $1:2.0
tmux splitw -h -p 5 -t $1:2.0
tmux clock -t $1:2.1
tmux select-window -t $1:0.0
#tmux a -t $1
}
tmuxstart S1
echo Exitting Session
exit 0

# Other useful
# 1. creating a detached session tmux new-session -d -s rtb123
# tmux new-session -d -s rtb123
# tmux send-keys 'vagrant up' C-m
# tmux detach -s rtb123
}

# sudo usermod --add-subuids 200000-201000 --add-subgids 200000-201000 michael 
# Error: writing blob: adding layer with blob (potentially insufficient UIDs or GIDs available in user namespace (requested 1000760003:54321 for /opt/oracle): Check /etc/subuid and /etc/subgid if configured locally and run "podman system migrate": lchown /opt/oracle: invalid argument): exit status 1
# error on / not shared when docker images 
# sudo mount --make-shared /
