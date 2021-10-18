if type -q fish_add_path
    # Available since 3.2.0
    fish_add_path -v -m ~/.local/bin
else
    # Fallback for older versions (e.g. Debian/Ubuntu are still on 3.1.0)
    contains (realpath ~/.local/bin) $fish_user_paths; or set -Ua fish_user_paths (realpath ~/.local/bin)
end

alias ll="ls -l"
alias la="ls -la"
