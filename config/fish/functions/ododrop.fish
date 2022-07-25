# Defined in - @ line 1
function ododrop --wraps='dropdb' --description 'Drop Odoo Postgresql dev database'
  dropdb odoodb $argv;
end
