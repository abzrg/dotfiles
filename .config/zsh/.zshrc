# Xterm title (archwiki)
autoload -Uz add-zsh-hook

function xterm_title_precmd () {
    print -Pn -- '\e]2;%n@%m %~\a'
    [[ "$TERM" == 'screen'* ]] && print -Pn -- '\e_\005{g}%n\005{-}@\005{m}%m\005{-} \005{B}%~\005{-}\e\\'
}

function xterm_title_preexec () {
    print -Pn -- '\e]2;%n@%m %~ %# ' && print -n -- "${(q)1}\a"
    [[ "$TERM" == 'screen'* ]] && { print -Pn -- '\e_\005{g}%n\005{-}@\005{m}%m\005{-} \005{B}%~\005{-} %# ' && print -n -- "${(q)1}\e\\"; }
}

if [[ "$TERM" == (Eterm*|alacritty*|aterm*|gnome*|konsole*|kterm*|putty*|rxvt*|screen*|tmux*|xterm*|st*) ]]; then
    add-zsh-hook -Uz precmd xterm_title_precmd
    add-zsh-hook -Uz preexec xterm_title_preexec
fi

# Misc.
setopt autocd       # Automatically cd into typed directory.
stty stop undef     # Disable ctrl-s to freeze terminal.
setopt interactive_comments

# History in cache directory:
HISTSIZE=10000000           # How many lines of history to keep in memory
SAVEHIST=10000000           # Number of history entries to save to disk
HISTFILE=~/.cache/zsh/history
HISTDUP=erase               # Erase duplicates in the history file
HISTORY_IGNORE='([bf]g *|cd ..|l[alsh]#( *)#|less *)'
setopt HIST_FIND_NO_DUPS    # When searching do not display duplicates of a line
                            # previously found, even if the duplicates are not contiguous
setopt HIST_REDUCE_BLANKS   # Remove superfluous blanks
setopt HIST_IGNORE_SPACE    # Useful when you want a command vanish right away
setopt HIST_VERIFY          # perform history expansion and reload the line into the editing buffer
setopt appendhistory        # Append history to the history file (no overwriting)
# setopt    sharehistory    # Share history across terminals
setopt incappendhistory     # Immediately append to the history file, not just when a term is killed

# Load aliases and shortcuts if existent.
[ -f "${XDG_CONFIG_HOME:-$HOME/.config}/aliasrc" ] && source "${XDG_CONFIG_HOME:-$HOME/.config}/aliasrc"

# Basic auto/tab complete:
autoload -U compinit
zstyle ':completion:*' menu select

# Auto complete with case insenstivity
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'

zmodload zsh/complist
compinit
_comp_options+=(globdots)       # Include hidden files.

# Persistent rehash
zstyle ':completion:*' rehash true

# Autocomplete for aliases
setopt completealiases

# vi mode
bindkey -v
export KEYTIMEOUT=1

# Enable searching through history
bindkey '^R' history-incremental-pattern-search-backward

# Use vim keys in tab complete menu:
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -M menuselect 'left' vi-backward-char
bindkey -M menuselect 'down' vi-down-line-or-history
bindkey -M menuselect 'up' vi-up-line-or-history
bindkey -M menuselect 'right' vi-forward-char

# Fix backspace bug when switching modes
bindkey "^?" backward-delete-char

# History search
bindkey "^[[A" history-beginning-search-backward
bindkey "^[[B" history-beginning-search-forward
bindkey "\C-p" history-beginning-search-backward
bindkey "\C-n" history-beginning-search-forward

# Change cursor shape for different vi modes.
function zle-keymap-select {
  if [[ ${KEYMAP} == vicmd ]] ||
     [[ $1 = 'block' ]]; then
    echo -ne '\e[1 q'
  elif [[ ${KEYMAP} == main ]] ||
       [[ ${KEYMAP} == viins ]] ||
       [[ ${KEYMAP} = '' ]] ||
       [[ $1 = 'beam' ]]; then
    echo -ne '\e[5 q'
  fi
}
zle -N zle-keymap-select

# ci", ci', ci`, di", etc
autoload -U select-quoted
zle -N select-quoted
for m in visual viopp; do
  for c in {a,i}{\',\",\`}; do
    bindkey -M $m $c select-quoted
  done
done

# ci{, ci(, ci<, di{, etc
autoload -U select-bracketed
zle -N select-bracketed
for m in visual viopp; do
  for c in {a,i}${(s..)^:-'()[]{}<>bB'}; do
    bindkey -M $m $c select-bracketed
  done
done

zle-line-init() {
    zle -K viins # initiate `vi insert` as keymap (can be removed if `bindkey -V` has been set elsewhere)
    echo -ne "\e[5 q"
}
zle -N zle-line-init
echo -ne '\e[5 q' # Use beam shape cursor on startup.
precmd() { echo -ne '\e[5 q' ;} # Use beam shape cursor for each new prompt.

# Use lf to switch directories and bind it to ctrl-o
lfcd () {
    tmp="$(mktemp)"
    lf -last-dir-path="$tmp" "$@"
    if [ -f "$tmp" ]; then
        dir="$(cat "$tmp")"
        rm -f "$tmp" >/dev/null
        [ -d "$dir" ] && [ "$dir" != "$(pwd)" ] && cd "$dir"
    fi
}
bindkey -s '\eo' 'lfcd\n'

bindkey -s '\ea' 'bc -lq\n'
bindkey -s '\em' 'dman\n'

# fzf
source /usr/share/fzf/key-bindings.zsh
source /usr/share/fzf/completion.zsh

bindkey -s '\ef' 'cd_with_fzf\n'
bindkey -s '\ep' 'install_with_fzf\n'
bindkey -s '\er' 'remove_with_fzf\n'

# Fix delete key
bindkey "\e[3~" delete-char

# Some useful emacs bindings
bindkey '\e.' 'insert-last-word'
bindkey "^A" beginning-of-line
bindkey "^E" end-of-line
bindkey "^W" backward-kill-word
bindkey "^K" kill-line
bindkey "^B" backward-char
bindkey "^F" forward-char
bindkey "^Y" yank
bindkey '\ew' push-line-or-edit

# Comment a line interactively
setopt INTERACTIVE_COMMENTS
bindkey '\e3' pound-insert

# Edit line in vim with ctrl-e:
autoload edit-command-line; zle -N edit-command-line
bindkey '\ee' edit-command-line

# Enter vim buffer from normal mode
autoload -U edit-command-line && zle -N edit-command-line && bindkey -M vicmd "^v" edit-command-line

# Load syntax highlighting; should be last.
source /usr/share/zsh/plugins/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh 2>/dev/null
# Suggest aliases for commands
# source /usr/share/zsh/plugins/zsh-you-should-use/you-should-use.plugin.zsh
# Search repos for programs that can't be found
# source /usr/share/doc/pkgfile/command-not-found.zsh

# Openfoam
autoload bashcompinit
bashcompinit
alias fe41="source ~/foam/foam-extend-4.0/etc/bashrc"
alias of7="source ${FOAM_INST_DIR}/OpenFOAM-7/etc/bashrc"
alias of8="source ${FOAM_INST_DIR}/OpenFOAM-8/etc/bashrc"
alias of8d="source ${FOAM_INST_DIR}/OpenFOAM-8-debug/etc/bashrc"

# Open files with neovim
alias -s {c,cpp,cc,cxx,C,H,h,hpp,html,js,css,py,pl,md,txt,tex}=nvim

# Faster navigation with z.lua
eval "$(lua ~/.local/src/z.lua-1.8.13/z.lua --init zsh)"

# Random events of the day
shuf -n1 ~/.wikidates/$(date +%B_%d)

# Prompt
autoload -U colors && colors # Load colors
autoload -Uz vcs_info # Load vcs_info function
zstyle ':vcs_info:*' enable git hg
zstyle ':vcs_info:*' disable bzr svn cdv darcs mtn svk tla # I don't use these VCSs
zstyle ':vcs_info:*' formats '%F{green}(%b)%f'
function precmd() { vcs_info } # Update each time new prompt is rendered
setopt prompt_subst # Allow dynamic command prompt
PS1='%B%F{magenta}%(3~|%2~|%~)%f ${vcs_info_msg_0_}%F{red}%(?..(%?%))%f%F{blue}%#%f%b '
