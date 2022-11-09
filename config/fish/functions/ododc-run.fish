function ododc-run --wraps='ododc run --service-ports dev --database odoodb --addons-path=odoo/addons,enterprise' --description 'alias ododc-run=ododc run --service-ports dev --database odoodb --addons-path=odoo/addons,enterprise'
  ododc run --service-ports dev --database odoodb --addons-path=odoo/addons,enterprise $argv; 
end
