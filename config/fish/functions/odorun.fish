# Defined in - @ line 1
function odorun --wraps='docker run' --description 'Run Odoo server in Docker dev environment'
  docker run -it --rm -p 8069:8069 -v (realpath .):/src -v /var/tmp/odoo:/var/lib/odoo -v /var/run/postgresql:/var/run/postgresql -v /etc/passwd:/etc/passwd --user (id -u):(id -u) odoo-local-dev --dev xml,qweb,reload $argv;
end
