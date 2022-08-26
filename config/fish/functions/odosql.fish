# Defined in - @ line 1
function odosql --wraps='psql' --description 'Run psql inside Odoo development database container'
  docker exec -it odoo-db psql -U odoo $argv;
end
