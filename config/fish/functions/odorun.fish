# Defined in - @ line 1
function odorun --wraps='docker run' --description 'Run Odoo server in Docker dev environment'
    docker run \
        --name odoo-dev \
        --interactive \
        --tty \
        --rm \
        --publish 8069:8069 \
        --network odoo-network \
        --volume (realpath .):/src \
        --volume /var/tmp/odoo:/var/lib/odoo \
        --volume /etc/passwd:/etc/passwd:ro \
        --user (id -u):(id -u) \
        -e PGHOST=odoo-db \
        odoo-local-dev \
	--database odoodb \
	--addons-path=odoo/addons,enterprise \
        $argv;
end
