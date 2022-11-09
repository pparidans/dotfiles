function ododc --wraps='COMPOSE_PROJECT_NAME=odoo UID=(id -u) docker-compose' --description 'alias ododc=COMPOSE_PROJECT_NAME=odoo UID=(id -u) docker-compose'
  COMPOSE_PROJECT_NAME=odoo UID=(id -u) docker-compose $argv; 
end
