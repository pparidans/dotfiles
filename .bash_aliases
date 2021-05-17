# helpers
function command_exists() {
    command -v $1 &> /dev/null
}


#
# Shell config
#
if [ -d "$HOME/.local/bin" ]; then
    PATH="$PATH:$HOME/.local/bin"
fi


#
# Bash config
#

# enable auto-cd into directory
shopt -s autocd
# Case-insensitive completion
bind 'set completion-ignore-case on'

# If there are multiple matches for completion, Tab should cycle through them
bind '"\t":menu-complete'
bind '"\e[Z": menu-complete-backward'

# Display a list of the matching files
bind 'set show-all-if-ambiguous on'

# Perform partial completion on the first Tab press,
# only start cycling full results on the second Tab press
bind 'set menu-complete-display-prefix on'

# Cycle through history based on characters already typed on the line
bind '"\e[A":history-search-backward'
bind '"\e[B":history-search-forward'

alias ll="ls -l"
alias la="ls -la"

#
# enable Git
#
if ! command_exists git; then
    echo "Couldn't enable Git aliases ; 'apt install git' to enable them."
else
    source /usr/share/bash-completion/completions/git

    function git_current_branch() {
         git branch --show-current
    }

    alias gaa='git add --all'
    __git_complete gaa _git_add
    alias gapa='git add --patch'
    __git_complete gapa _git_add
    alias gb='git branch -v'
    __git_complete gb _git_branch
    alias gc='git commit -v'
    __git_complete gc _git_commit
    alias gc!='git commit -v --amend'
    __git_complete gc! _git_commit
    alias gca='git commit -v -a'
    __git_complete gca _git_commit
    alias gca!='git commit -v -a --amend'
    __git_complete gca! _git_commit
    alias gco='git checkout'
    __git_complete gco _git_checkout
    alias gcp='git cherry-pick'
    __git_complete gcp _git_cherry_pick
    alias gd='git diff'
    __git_complete gd _git_diff
    alias gdca='git diff --cached'
    __git_complete gdca _git_diff
    alias gfa='git fetch --all --prune --jobs=10'
    __git_complete gfa _git_fetch
    alias glo='git log --oneline --decorate'
    __git_complete glo _git_log
    alias grb='git rebase'
    __git_complete grb _git_rebase
    alias groh='git reset origin/$(git_current_branch) --hard'
    __git_complete groh _git_reset
    alias gsh='git show'
    __git_complete gsh _git_show
    alias gst='git status'
    __git_complete gst _git_status

    # Configure `__git_ps1`
    export GIT_PS1_SHOWDIRTYSTATE=1
    export GIT_PS1_SHOWUNTRACKEDFILES=1
    export GIT_PS1_DESCRIBE_STYLE=branch
    export GIT_PS1_SHOWCOLORHINTS=1
    export GIT_PS1_HIDE_IF_PWD_IGNORED=1

    # Add Git to the prompt
    export PS1=$(sed 's/ *\\$ *$//' <<<"${PS1}")'$(__git_ps1 " (%s)")\[\e[0;37m\] \$\[\e[0m\] '
fi

#
# enable PasteBoard
#
if ! command_exists xsel; then
    echo "Couldn't enable PasteBoard aliases ; 'apt install xsel' to enable them."
else
    alias pbcopy='xsel --clipboard --input'
    alias pbpaste='xsel --clipboard --output'
fi

#
# enable Odoo helpers
#
if ! command_exists git_current_branch; then
    echo "Couldn't enable Odoo helpers ; Git is required."
elif ! command_exists psql; then
    echo "Couldn't enable Odoo helpers ; PostgreSQL is required."
elif ! command_exists python3; then
    echo "Couldn't enable Odoo helpers ; Python 3 is required."
else
    ODOO_VIRTUALENV_PATH="$HOME/.venv/odoo-venv"
    ODOO_ENTERPRISE_ADDONS=addons,../enterprise

    function create-odoo-venv() {
        if [ ! -d $ODOO_VIRTUALENV_PATH ]; then
            mkdir -p $ODOO_VIRTUALENV_PATH
        fi
        python3 -m venv --prompt odoo-venv $ODOO_VIRTUALENV_PATH
    }

    function activate-odoo-venv() {
        if [ ! -f $ODOO_VIRTUALENV_PATH/bin/activate ]; then
            echo "Odoo VirtualEnv doesn't exist ; creating it"
            create-odoo-venv
        fi
        if ! [[ $VIRTUAL_ENV =~ $ODOO_VIRTUALENV_PATH$ ]]; then
            source $ODOO_VIRTUALENV_PATH/bin/activate
        fi
    }

    function _odoo_db_name() {
        echo "odoodb-$(git_current_branch)"
    }

    alias odev-db="_odoo_db_name"

    function otest-db() {
        echo "$(_odoo_db_name)-test"
    }


    function olist-all() {
        psql --list -t | cut -f2 -d" " | sed '/^\s*$/d' | sed -n '/^odoodb/p'
    }

    function oclean() {
        dropdb --if-exists `odev-db`
        dropdb --if-exists `otest-db`
    }

    function oclean-all() {
        olist-all | while read in; do dropdb --if-exists "$in"; done
    }

    function orun() {
        activate-odoo-venv
        ./odoo-bin -d `odev-db` "$@"
    }

    alias orun-ent="orun --addons-path=$ODOO_ENTERPRISE_ADDONS"

    alias odev="orun --dev qweb,xml,reload"
    alias odev-ent="odev --addons-path=$ODOO_ENTERPRISE_ADDONS"

    function otest() {
        activate-odoo-venv
        ./odoo-bin -d `otest-db` --test-enable "$@"
    }

    alias otest-ent="otest --addons-path=$ODOO_ENTERPRISE_ADDONS"

    function oshell() {
        activate-odoo-venv
        ./odoo-bin shell -d `odev-db` "$@"
    }

    alias oshell-ent="oshell --addons-path=$ODOO_ENTERPRISE_ADDONS"

    function ofresh() {
        oclean
        orun "$@"
    }

    alias ofresh-ent="ofresh --addons-path=$ODOO_ENTERPRISE_ADDONS"
fi

