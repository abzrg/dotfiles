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
export TERMINAL="alacritty"
export BROWSER="brave"
export READER="zathura"
export PAGER="less"
export FILE="lf"
export FZF_DEFAULT_OPTS="--layout=reverse --height 50%"
export FZF_DEFAULT_COMMAND='fd -H -I' # Including hidden files in search
export LESSOPEN='|/usr/bin/lesspipe.sh %s' # allow less to view non-text files
export LESS_TERMCAP_mb=$'\e[1;32m'      # begin bold
export LESS_TERMCAP_md=$'\e[1;32m'      # begin blink
export LESS_TERMCAP_me=$'\e[0m'         # reset bold/blink
export LESS_TERMCAP_so=$'\e[01;33m'     # begin reverse video
export LESS_TERMCAP_se=$'\e[0m'         # reset reverse video
export LESS_TERMCAP_us=$'\e[1;4;31m'    # begin underline
export LESS_TERMCAP_ue=$'\e[0m'         # reset underline
export LESS=-R
export COLORTERM="truecolor"

# SHOPT
shopt -s checkwinsize # checks term size when bash regains control
shopt -s autocd # change to named directory
shopt -s cdspell # autocorrects cd misspellings
shopt -s cmdhist # save multi-line commands in history as single line
shopt -s direxpand # If set, Bash replaces directory names with the results of word expansion when performing filename completion.
shopt -s dotglob # Wildcards match dotfiles ("*.sh" => "foo.sh")
shopt -s histappend # append to the history file, do not overwrite history
shopt -s expand_aliases # expand aliases. use C-A-e for expantion
shopt -s no_empty_cmd_completion
shopt -s globstar # Allow ** for recursive matches ('lib/**/*.sh' => 'lib/a/b/c.sh')
shopt -s histverify # Don't execute expand result immediately
stty -ixon # Disable ctrl-s and ctrl-q.

# History
HISTCONTROL=ignoreboth:erasedups # ignore duplicate and line starting space
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

############
## prompt ##
############

COLOR_RED="\033[0;31m"
COLOR_YELLOW="\033[0;33m"
COLOR_GREEN="\033[0;32m"
COLOR_OCHRE="\033[38;5;95m"
COLOR_BLUE="\033[0;34m"
COLOR_WHITE="\033[0;37m"
COLOR_RESET="\033[0m"

PROMPT_DIRTRIM=2    # only show the last two entries

# PS1="\$(history -a)\[$COLOR_GREEN\][\w]\[$COLOR_RED\]\$(__git_ps1)"
# PS1+="\[$COLOR_BLUE\]\$\[$COLOR_RESET\] "

# Luke Smith's propmt
PS1='$(history -a)\[\e[1;31m\][\[\e[1;33m\]\u\[\e[1;32m\]@\[\e[1;34m\]\h \[\e[1;35m\]\w\[\e[1;36m\]$(__git_ps1)\[\e[1;31m\]]\[\e[0m\]$ '

# Note that you don't need to, and should not, export PS1, since it's a shell setting, not an environment variable. A bash PS1 setting wouldn't be understood by other shells.
# PS1='$(history -a)[\w]$(__git_ps1)\[\e[0m\]\$ '

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
bind '"\ed":"cd_with_fzf\r"'
bind '"\ex":"text_file_with_fzf\r"'
bind '"\eh":"text_file_cur_dir_with_fzf\r"'
bind '"\eo":"open_with_fzf\r"'
bind '"\ep":"install_with_fzf\r"'
bind '"\er":"remove_with_fzf\r"'

# Find man page easier with dman script
bind '"\em":"dman\r"'

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

# OpenFOAM
alias of7='source ~/OpenFOAM/OpenFOAM-7/etc/bashrc'
alias of8='source ~/OpenFOAM/OpenFOAM-8/etc/bashrc'
alias of8d='source ~/OpenFOAM/OpenFOAM-8-debug/etc/bashrc'
alias fe40='source $HOME/foam/foam-extend-4.0/etc/bashrc'

# aliasrc
[ -f "$HOME/.config/aliasrc" ] && source "$HOME/.config/aliasrc"

# git tab-completion <https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash>
source ~/.local/share/git-completion.bash

# z : tracks most used directories based on 'frequency'
[[ -r "/usr/share/z/z.sh" ]] && source /usr/share/z/z.sh

# # Base16 Shell
# BASE16_SHELL="$HOME/.config/base16-shell/"
# [ -n "$PS1" ] && \
#     [ -s "$BASE16_SHELL/profile_helper.sh" ] && \
#         eval "$("$BASE16_SHELL/profile_helper.sh")"

# Broot
source /home/ali/.config/broot/launcher/bash/br

# lfcd
LFCD="$HOME/.config/lf/lfcd.sh"
if [ -f "$LFCD" ]; then
    source "$LFCD"
fi
# change directory to the current directory
bind '"\C-o":"lfcd\C-m"'  # bash
