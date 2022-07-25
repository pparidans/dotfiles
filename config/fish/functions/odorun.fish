# Defined in - @ line 1
function odorun --wraps='docker run' --description 'Run Odoo server in Docker dev environment'
    docker run \
        --interactive \
        --tty \
        --rm \
        --publish 8069:8069 \
        --volume (realpath .):/src \
        --volume /var/tmp/odoo:/var/lib/odoo \
        --volume /var/run/postgresql:/var/run/postgresql \
        --volume /etc/passwd:/etc/passwd \
        --user (id -u):(id -u) \
        odoo-local-dev \
	--database odoodb \
	--addons-path=odoo/addons,enterprise \
        $argv;
end
