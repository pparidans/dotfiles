# Defined in - @ line 1
function pbcopy --wraps='xsel' --description 'alias pbcopy=xsel --clipboard --input'
  xsel --clipboard --input $argv;
end
