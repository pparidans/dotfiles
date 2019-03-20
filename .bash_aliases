# Create screen session or reattach existing one
if [ -x "$(command -v screen)" ]; then
    alias sr="screen -d -R"
fi

# Copy/Pasting from command-line (apt install xsel)
if [ -x "$(command -v xsel)" ]; then
    alias pbcopy='xsel --clipboard --input'
    alias pbpaste='xsel --clipboard --output'
fi

alias git-gone="git branch -vv | awk '/: gone]/{print $1}'"

#
# Odoo configuration & aliases
#

function git-current-branch() {
    git rev-parse --abbrev-ref HEAD
}

function odev-db() {
    echo "odoodb-`git-current-branch`"
}

function otest-db() {
    echo "`odev-db`-test"
}

function orun() {
    workon odoo-venv
    ./odoo-bin -d `odev-db` "$@"
}

function orun9() {
    workon odoo10-venv
    ./odoo.py -d `odev-db` "$@"
}

function orun10() {
    workon odoo10-venv
    ./odoo-bin -d `odev-db` "$@"
}

function oshell() {
    workon odoo-venv
    ./odoo-bin shell -d `odev-db` "$@"
}

function oshell10() {
    workon odoo10-venv
    ./odoo-bin shell -d `odev-db` "$@"
}

function otest() {
    workon odoo-venv
    ./odoo-bin -d `otest-db` --test-enable "$@"
}

function otest10() {
    workon odoo10-venv
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
alias orun9-ent="orun9 --addons-path=addons,../enterprise"
alias orun10-ent="orun10 --addons-path=addons,../enterprise"
alias odev="orun --dev all"
alias odev10="orun10 --dev all"
alias odev-ent="orun-ent --dev all"
alias odev10-ent="orun10-ent --dev all"
alias otest-ent="otest --addons-path=addons,../enterprise"
alias otest10-ent="otest10 --addons-path=addons,../enterprise"
