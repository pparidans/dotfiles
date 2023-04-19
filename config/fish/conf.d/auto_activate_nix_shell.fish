function __auto_activate_nix_shell --on-variable PWD --description "Automatically activate nix-shell if present"
  status --is-command-substitution; and return
  if ! test -f (realpath $PWD/shell.nix)
    return
  end
  nix-shell
end
