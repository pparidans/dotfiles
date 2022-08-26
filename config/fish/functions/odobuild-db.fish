# Defined in - @ line 1
function odobuild-db --wraps='docker run' --description 'Create and start Odoo development database container'
  docker run \
             --name odoo-db \
             --restart always \
             --network odoo-network \
             --detach \
             -e POSTGRES_USER=odoo \
             -e POSTGRES_PASSWORD=odoo \
             postgres:14 \
             $argv;
end
