if ! type -q xsel
    echo "Couldn't enable PasteBoard aliases ; 'apt install xsel' to enable them."
else
    alias pbcopy="xsel --clipboard --input"
    alias pbpaste="xsel --clipboard --output"
end
