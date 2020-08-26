# This plugin adds utility functions & aliases to start Odoo server using
# VirtualenvWrapper and Git

alias obranch-gone="git branch -vv | awk '/: gone]/{print $1}'"
alias obranch-gone-clean="obranch-gone | cut -d\" \" -f3 | xargs git branch -D"

function odev-db() {
    echo "odoodb-`git rev-parse --abbrev-ref HEAD`"
}

function otest-db() {
    echo "`odev-db`-test"
}

function orun() {
    workon odoo-venv
    ./odoo-bin -d `odev-db` "$@"
}

function oshell() {
    workon odoo-venv
    ./odoo-bin shell -d `odev-db` "$@"
}

function otest() {
    workon odoo-venv
    ./odoo-bin -d `otest-db` --test-enable "$@"
}

function oclean() {
    dropdb --if-exists `odev-db`
    dropdb --if-exists `otest-db`
}

function olist-all() {
    psql --list -t | cut -f2 -d" " | sed '/^\s*$/d' | sed -n '/^odoodb/p'
}

function oclean-all() {
    olist-all | while read in; do dropdb --if-exists --interactive "$in"; done
}

alias orun-ent="orun --addons-path=addons,../enterprise"
alias odev="orun --dev all"
alias odev-ent="orun-ent --dev all"
alias otest-ent="otest --addons-path=addons,../enterprise"
