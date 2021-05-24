# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# Environment variables
export LANG="en_US.UTF-8"
export EDITOR="nvim"
export VISUAL="nvim"
export TERMINAL="st"
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


#################
# SHell OPTions #
#################

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


###########
# History #
###########

# Ignore duplicate and line starting space
HISTCONTROL=ignoreboth:erasedups

# Size of the history file
HISTSIZE=""
HISTFILESIZE=""
export HISTFILE="${XDG_DATA_HOME:-$HOME/.local/share}/history"

# NOTE: To mark the history file append only issue the following command:
#    # chattr +a $HISTFILE

# Safety measures
readonly HISTFILE
readonly HISTSIZE
readonly HISTFILESIZE
readonly HISTIGNORE
readonly HISTCONTROL
readonly HISTTIMEFORMAT


####################
# Prompt and title #
####################

# Change title of terminals
case ${TERM} in
  xterm*|rxvt*|Eterm*|aterm|kterm|gnome*|alacritty|st*|konsole*)
    PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME%%.*}:${PWD/#$HOME/\~}\007"'
        ;;
  screen*)
    PROMPT_COMMAND='echo -ne "\033_${USER}@${HOSTNAME%%.*}:${PWD/#$HOME/\~}\033\\"'
    ;;
esac

# Define colors
COLOR_RED="\033[0;31m"
COLOR_YELLOW="\033[0;33m"
COLOR_GREEN="\033[0;32m"
COLOR_OCHRE="\033[38;5;95m"
COLOR_BLUE="\033[0;34m"
COLOR_WHITE="\033[0;37m"
COLOR_RESET="\033[0m"

# Only retain 2 trailing directory components when expanding \w prompt string escape. Characters are replaced with an ellipsis.
PROMPT_DIRTRIM=2

# NOTE:
#   - `history -a`: append history lines from this session to the history file
#   - you don't need to, and should not, export PS1, since it's a shell
#   setting, not an environment variable. A bash PS1 setting wouldn't be
#   understood by other shells.

# Git prompt script that should be sourced in arch based distributions in order
# to be used in the prompt
source /usr/share/git/completion/git-prompt.sh

# A prompt inspired by Luke Smith's prompt
PS1='$(history -a)\[\e[1;31m\][\[\e[1;33m\]\u\[\e[1;32m\]@\[\e[1;34m\]\h \[\e[1;35m\]\w\[\e[1;36m\]$(__git_ps1)\[\e[1;31m\]]\[\e[0m\]$ '

# A very simple prompt
# PS1='$(history -a)\w $ '

# We can append strings to the PS1 prompt
# PS1="\$(history -a)\[$COLOR_GREEN\][\w]\[$COLOR_RED\]\$(__git_ps1) "
# PS1+="\[$COLOR_BLUE\]\$\[$COLOR_RESET\] "


# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|*rxvt*)
    PS1="\[\e]0;\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac


###############################
# Sourcing Programms Settings #
###############################

#----[ Aliases ]---------------------------------------------------------------
[ -f "$HOME/.config/aliasrc" ] && source "$HOME/.config/aliasrc"

#----[ Tab completion for git ]------------------------------------------------
# source: https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash
source ~/.local/share/git-completion.bash

#----[ z ]---------------------------------------------------------------------
# Tracks most used directories based on 'frequency'
[[ -r "/usr/share/z/z.sh" ]] && source /usr/share/z/z.sh

#----[ Broot ]-----------------------------------------------------------------
source /home/ali/.config/broot/launcher/bash/br

#----[ lfcd ]------------------------------------------------------------------
LFCD="$HOME/.local/bin/lfcd.sh"
if [ -f "$LFCD" ]; then
    source "$LFCD" &>/dev/null
fi
# change directory to the current directory
bind '"\C-o":"lfcd\C-m"'  # bash

#----[ fzf ]-------------------------------------------------------------------
# Source some default examples
source /usr/share/fzf/key-bindings.bash
source /usr/share/fzf/completion.bash

# Functions are implemented in aliasrc
# See function definitions with: "declare -f <function>" or "type <function>
bind '"\ef":"cd_with_fzf\r"'
bind '"\ex":"text_file_with_fzf\r"'
bind '"\eh":"text_file_cur_dir_with_fzf\r"'
bind '"\eo":"open_with_fzf\r"'
bind '"\ep":"install_with_fzf\r"'
bind '"\er":"remove_with_fzf\r"'

##---- Base16 Shell ----------------------------------------------------------
#BASE16_SHELL="$HOME/.config/base16-shell/"
#[ -n "$PS1" ] && \
#    [ -s "$BASE16_SHELL/profile_helper.sh" ] && \
#        eval "$("$BASE16_SHELL/profile_helper.sh")"


################
# Miscellaneus #
################

#----[ Fix problems of delete key in terminal ]--------------------------------
printf '\033[?1h\033=' >/dev/tty

#----[ Colored GCC warnings and errors ]---------------------------------------
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

#----[ Enable programmable completion features ]-------------------------------
# (you don't need to enable this, if it's already enabled in /etc/bash.bashrc
# and /etc/profile sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

#----[ Find man page easier with dman script ]---------------------------------
bind '"\em":"dman\r"'

# Random events of the day
shuf -n1 ~/.wikidates/$(date +%B_%d)
