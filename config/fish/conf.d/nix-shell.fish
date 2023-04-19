if test -n "$IN_NIX_SHELL"
    # Save the current fish_prompt function as the function _pre_nix_shell_fish_prompt.
    functions -c fish_prompt _pre_nix_shell_fish_prompt

    # With the original prompt function renamed, we can override with our own.
    function fish_prompt
        # Save the return status of the last command.
        set -l old_status $status

        # Output the venv prompt; color taken from the blue of the Python logo.
        printf "%s%s%s" (set_color 4B8BBE) "<nix-shell> " (set_color normal)

        # Restore the return status of the previous command.
        echo "exit $old_status" | .
        # Output the original/"old" prompt.
        _pre_nix_shell_fish_prompt
    end
end
