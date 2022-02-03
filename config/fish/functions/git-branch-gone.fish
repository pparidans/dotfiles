# Defined in - @ line 1
function git-branch-gone --description 'git: list local branches deleted on remote'
  LANG=C git branch -v | string match -e -r "^\*" -v | string match -e "[gone]" | string trim | cut -d " " -f 1 $argv;
end
