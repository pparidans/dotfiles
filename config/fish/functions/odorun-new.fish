# Defined in - @ line 1
function odorun-new --wraps='docker run' --description 'Run clean Odoo server in Docker dev environment'
  ododrop && odorun $argv;
end
