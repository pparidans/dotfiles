alias __odoodbname="git --git-dir=odoo/.git branch --show-current"

function ododrop {
  dropdb -i `__odoodbname`
}

function odorun {
  ODOO_VIRTUALENV_PATH="$HOME/.virtualenvs/odoo"
  if [ -z $VIRTUAL_ENV ] || [ $VIRTUAL_ENV != $ODOO_VIRTUALENV_PATH ]; then
    source $ODOO_VIRTUALENV_PATH/bin/activate
  fi

  ODOOBIN_OPTIONAL_ARGUMENTS=""
  if [[ `uname` == "Darwin" ]]; then
    ODOOBIN_OPTIONAL_ARGUMENTS="--limit-memory-hard 0"
  fi

  python odoo/odoo-bin \
    --dev xml,qweb,reload \
    --database `__odoodbname` \
    --addons-path odoo/addons,enterprise \
    `echo $ODOOBIN_OPTIONAL_ARGUMENTS` \
    $@
}
