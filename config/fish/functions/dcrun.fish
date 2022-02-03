# Defined in - @ line 1
function dcrun --wraps='docker-compose run --service-ports' --description 'alias dcrun=docker-compose run --service-ports'
  docker-compose run --service-ports $argv;
end
