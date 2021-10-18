if ! type -q git
    echo "Couldn't enable Odoo helpers ; Git is required."
else if ! type -q psql
    echo "Couldn't enable Odoo helpers ; PostgreSQL is required."
else if ! type -q python3
    echo "Couldn't enable Odoo helpers ; Python 3 is required."
else
    set ODOO_VIRTUALENV_PATH (realpath ~/.venv/odoo-venv)
    set ODOO_ENTERPRISE_ADDONS "addons,../enterprise"

    function create-odoo-venv
        if ! test -d $ODOO_VIRTUALENV_PATH
            mkdir -p $ODOO_VIRTUALENV_PATH
        end
        python3 -m venv --prompt odoo-venv $ODOO_VIRTUALENV_PATH
    end

    function activate-odoo-venv
        if ! test -f $ODOO_VIRTUALENV_PATH/bin/activate.fish
            echo "Odoo VirtualEnv doesn't exist ; creating it"
            create-odoo-venv
        end
        if ! string match "*$ODOO_VIRTUALENV_PATH" $VIRTUAL_ENV
            source $ODOO_VIRTUALENV_PATH/bin/activate.fish
        end
    end
    
    function _odoo_db_name
        echo "odoodb-"(git branch --show-current)
    end

    alias odev-db="_odoo_db_name"

    function otest-db
        echo (_odoo_db_name)"-test"
    end

    alias olist-all="psql --list -t | cut -d '|' -f 1 | string trim | string match 'odoodb*'"

    function oclean
        dropdb --if-exists (odev-db)
        dropdb --if-exists (otest-db)
    end

    function oclean-all
        for dbname in olist-all
            dropdb --if-exists $dbname
        end
    end

    function orun
        activate-odoo-venv
        ./odoo-bin -d (odev-db) $argv
    end

    alias orun-ent="orun --addons-path=$ODOO_ENTERPRISE_ADDONS"

    alias odev="orun --dev qweb,xml,reload"
    alias odev-ent="odev --addons-path=$ODOO_ENTERPRISE_ADDONS"

    function otest
        activate-odoo-venv
        ./odoo-bin -d (otest-db) --test-enable $argv
    end

    alias otest-ent="otest --addons-path=$ODOO_ENTERPRISE_ADDONS"

    function oshell
        activate-odoo-venv
        ./odoo-bin shell -d (odev-db) $argv
    end

    alias oshell-ent="oshell --addons-path=$ODOO_ENTERPRISE_ADDONS"

    function ofresh
        oclean
        orun $argv
    end

    alias ofresh-ent="ofresh --addons-path=$ODOO_ENTERPRISE_ADDONS"
end
