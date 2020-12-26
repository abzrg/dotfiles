# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# environment variables
export LANG="en_US.UTF-8"
export EDITOR="nvim"
export VISUAL="nvim"
export TERMINAL="urxvtc"
export BROWSER="firefox"
export READER="zathura"
export FILE="lf"
export FZF_DEFAULT_OPTS="--layout=reverse --height 50%"
export FZF_DEFAULT_COMMAND='fd -H -I' # Including hidden files in search
export LESSOPEN='|/usr/bin/lesspipe.sh %s' # allow less to view non-text files
export LESS_TERMCAP_mb=$'\E[1;31m'     # begin bold
export LESS_TERMCAP_md=$'\E[1;36m'     # begin blink
export LESS_TERMCAP_me=$'\E[0m'        # reset bold/blink
export LESS_TERMCAP_so=$'\E[01;44;33m' # begin reverse video
export LESS_TERMCAP_se=$'\E[0m'        # reset reverse video
export LESS_TERMCAP_us=$'\E[1;32m'     # begin underline
export LESS_TERMCAP_ue=$'\E[0m'        # reset underline
export LESS=-R

# SHOPT
shopt -s checkwinsize # checks term size when bash regains control
shopt -s autocd # change to named directory
shopt -s cdspell # autocorrects cd misspellings
shopt -s cmdhist # save multi-line commands in history as single line
shopt -s dotglob
shopt -s histappend # append to the history file, do not overwrite history
shopt -s expand_aliases # expand aliases. use C-A-e for expantion
shopt -s no_empty_cmd_completion
shopt -s globstar # ** in pathname match all files, zero or more dir and subdirs
stty -ixon # Disable ctrl-s and ctrl-q.

# History
HISTCONTROL=ignoreboth # ignore duplicate and line starting space
HISTSIZE=10000
HISTFILESIZE=10000
export HISTFILE="${XDG_DATA_HOME:-$HOME/.local/share}/history"

# Colored GCC warnings and errors
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# Change title of terminals
case ${TERM} in
  xterm*|rxvt*|Eterm*|aterm|kterm|gnome*|alacritty|st|konsole*)
    PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME%%.*}:${PWD/#$HOME/\~}\007"'
        ;;
  screen*)
    PROMPT_COMMAND='echo -ne "\033_${USER}@${HOSTNAME%%.*}:${PWD/#$HOME/\~}\033\\"'
    ;;
esac

# Git prompt script that should be sourced in arch distros
source /usr/share/git/completion/git-prompt.sh

# prompt
PS1="\[\e[1;36m\]\W\[\e[1;32m\]$(__git_ps1)\[\e[1;31m\]:\[\e[0m\] "

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|*rxvt*)
    PS1="\[\e]0;\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# fzf
source /usr/share/fzf/key-bindings.bash
source /usr/share/fzf/completion.bash
# functions are implemented in aliasrc
# print function definition with: "declare -f <function>" or "type <function>
bind '"\ec":"cd_with_fzf\r"'
bind '"\ex":"text_file_with_fzf\r"'
bind '"\ey":"text_file_cur_dir_with_fzf\r"'
bind '"\eo":"open_with_fzf\r"'
bind '"\ep":"install_with_fzf\r"'
bind '"\er":"remove_with_fzf\r"'

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

# OpenFOAM7
alias of7='source ~/OpenFOAM/OpenFOAM-7/etc/bashrc'

# aliasrc
[ -f "$HOME/.config/aliasrc" ] && source "$HOME/.config/aliasrc"

# git tab-completion <https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash>
source ~/.local/share/git-completion.bash
