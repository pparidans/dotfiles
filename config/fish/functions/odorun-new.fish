# Defined in - @ line 1
function odorun-new --wraps='docker run' --description 'Run clean Odoo server in Docker dev environment'
  docker exec --interactive --tty odoo-db dropdb -U odoo odoodb --if-exists && odorun $argv;
end
