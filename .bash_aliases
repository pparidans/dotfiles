#!/bin/bash

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

alias create-venv="python3 -m venv --prompt venv --upgrade-deps .venv"

alias ll="ls -l"
alias la="ls -la"

# Automatically activate Python's virtualenv when changing directory
function cd() {
    builtin cd "$@" || exit
    if [ -d .venv ]; then
        source .venv/bin/activate
    fi
}

# PastBoard aliases
if [[ -n  "$WAYLAND_DISPLAY" ]]; then
    alias pbcopy="wl-copy"
    alias pbpaste="wl-paste"
else
    alias pbcopy="xsel --clipboard --input"
    alias pbpaste="xsel --clipboard --output"
fi

# Powerline prompt
if command -v powerline-daemon &> /dev/null; then
    powerline-daemon -q
    POWERLINE_BASH_CONTINUATION=1
    POWERLINE_BASH_SELECT=1
    source /usr/share/powerline/bindings/bash/powerline.sh
fi

# Odoo toolbelt
ODOO_DATABASE_NAME=odoodb

alias odorun="python odoo/odoo-bin --database=$ODOO_DATABASE_NAME --workers=0 --max-cron-threads=0 --dev=xml,reload"
alias odorun-ent="odorun --addons-path=odoo/addons,enterprise"
alias odoinit="python odoo/odoo-bin --database=$ODOO_DATABASE_NAME --workers=0 --max-cron-threads=0 --dev=xml --stop-after-init"
alias odoinit-ent="odoinit --addons-path=odoo/addons,enterprise"
alias odotest="odoinit --test-enable"
alias odotest-ent="odotest --addons-path=odoo/addons,enterprise"
alias ododrop="dropdb $ODOO_DATABASE_NAME --if-exists && rm -r $HOME/.local/share/Odoo/sessions"

function odoget() {
    DB_URL=$1
    echo "Restoring from $DB_URL"
    zipname=$(basename "$DB_URL")
    dbname=${zipname%.*}
    tmp_restore_path="/tmp/restore-$dbname"
    if [ -d "$tmp_restore_path" ]; then
        rm -r "$tmp_restore_path"
    fi
    mkdir "$tmp_restore_path"

    echo "Downloading..."
    wget "$DB_URL" -P "$tmp_restore_path"
    unzip "$tmp_restore_path/$zipname" -d "$tmp_restore_path"

    echo "Restoring filestore..."
    filestore_path="$HOME/.local/share/Odoo/filestore/$dbname"
    if [ -d "$filestore_path" ]; then
        rm -r "$filestore_path"
    fi
    mkdir "$filestore_path"
    mv "$tmp_restore_path"/filestore/* "$filestore_path"

    echo "Restoring database..."
    dropdb "$dbname" --if-exists
    createdb "$dbname"
    psql -q "$dbname" < "$tmp_restore_path/dump.sql"

    echo "Cleaning up..."
    rm -r "$tmp_restore_path"

    echo "Created db in $dbname"
}
