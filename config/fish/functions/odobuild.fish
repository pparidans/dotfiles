# Defined in - @ line 1
function odobuild --wraps='docker build' --description 'Build Odoo Docker dev environment'
  docker build . -t odoo-local-dev $argv;
end
