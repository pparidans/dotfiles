if status is-interactive
    # Commands to run in interactive sessions can go here
    set fish_greeting

    # Add dotfiles' `bin` to PATH
    set toplevel_path (realpath (readlink -f (status dirname))/../..)
    fish_add_path --path "$toplevel_path/bin"
end
