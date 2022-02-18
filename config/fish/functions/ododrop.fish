# Defined in - @ line 1
function ododrop --wraps='dropdb' --description 'Drop Odoo Postgresql dev database (use current git branch)'
  dropdb -i odoodb-(git --git-dir=odoo/.git branch --show-current) $argv;
end
