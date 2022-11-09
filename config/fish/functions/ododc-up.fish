function ododc-up --wraps='ododc up --detach --scale dev=0 db' --description 'alias ododc-up=ododc up --detach --scale dev=0 db'
  ododc up --detach --scale dev=0 db $argv; 
end
