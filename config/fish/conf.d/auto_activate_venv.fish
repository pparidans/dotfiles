function __auto_activate_venv --on-variable PWD --description "Automatically active Python VENV if present"
  status --is-command-substitution; and return
  set VENV_PATH (realpath $PWD/.venv)
  if ! test -f $VENV_PATH/bin/activate.fish
    return
  end
  echo "Activate VENV for $VENV_PATH"
  source $VENV_PATH/bin/activate.fish
end
