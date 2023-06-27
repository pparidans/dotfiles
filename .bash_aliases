# Automatically change directory
shopt -s autocd

# Case-insensitive completion
bind 'set completion-ignore-case on'

# If there are multiple matches for completion, Tab should cycle through them
bind 'TAB:menu-complete'
# And Shift-Tab should cycle backwards
bind '"\e[Z": menu-complete-backward'

# Display a list of the matching files
bind "set show-all-if-ambiguous on"

# Avoid showing "Display all X possibilities (y/n)" too early
bind 'set completion-query-items 1000'

# Perform partial (common) completion on the first Tab press, only start
# cycling full results on the second Tab press (from bash version 5)
bind "set menu-complete-display-prefix on"

# Cycle through history based on characters already typed on the line
bind '"\e[A":history-search-backward'
bind '"\e[B":history-search-forward'

# Keep Ctrl-Left and Ctrl-Right working when the above are used
bind '"\e[1;5C":forward-word'
bind '"\e[1;5D":backward-word'

# Number of trailing directories to show in prompt
PROMPT_DIRTRIM=2

# PastBoard aliases
if command -v xsel &> /dev/null; then
    alias pbcopy="xsel --clipboard --input"
    alias pbpaste="xsel --clipboard --output"
fi

# Git completion & prompt
if command -v git &> /dev/null; then
    BASH_COMPLETION_GIT="/usr/share/bash-completion/completions/git"
    if [ -f "$BASH_COMPLETION_GIT" ]; then
        source "$BASH_COMPLETION_GIT"
    fi

    export GIT_PS1_SHOWDIRTYSTATE=1
    export GIT_PS1_SHOWUNTRACKEDFILES=1
    export GIT_PS1_DESCRIBE_STYLE=branch
    export GIT_PS1_SHOWCOLORHINTS=1
    export GIT_PS1_HIDE_IF_PWD_IGNORED=1
    export PS1=$(sed 's/ *\\$ *$//' <<<"${PS1}")'$(__git_ps1 " (%s)")\[\e[0;37m\] \$\[\e[0m\] '

    # list all local branches for which the remote is "gone"
    alias git-branches-gone='LANG=C git branch -v | grep " \[gone\] " | sed "s/^ *//g" | cut -d" " -f1'
fi

# Automatically activate Python's virtualenv when changing directory
function cd() {
    builtin cd "$@"
    if [ -d .venv ]; then
        source .venv/bin/activate
    fi
}

