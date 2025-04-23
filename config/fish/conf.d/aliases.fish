if status is-interactive
    if command -q rg
        alias grep rg
    end
    if command -q fdfind
        alias find fdfind
    end
end
