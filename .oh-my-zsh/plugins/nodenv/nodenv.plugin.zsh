# This plugin loads nodenv into the current shell and provides prompt info via
# the 'nodenv_prompt_info' function.

FOUND_NODENV=$+commands[nodenv]

if [[ $FOUND_NODENV -ne 1 ]]; then
    nodenvdirs=("$HOME/.nodenv" "/usr/local/nodenv" "/opt/nodenv" "/usr/local/opt/nodenv")
    for dir in $nodenvdirs; do
        if [[ -d $dir/bin ]]; then
            export PATH="$dir/bin:$PATH"
            FOUND_NODENV=1
            break
        fi
    done
fi

if [[ $FOUND_NODENV -ne 1 ]]; then
    if (( $+commands[brew] )) && dir=$(brew --prefix nodenv 2>/dev/null); then
        if [[ -d $dir/bin ]]; then
            export PATH="$dir/bin:$PATH"
            FOUND_NODENV=1
        fi
    fi
fi

if [[ $FOUND_NODENV -eq 1 ]]; then
    eval "$(nodenv init --no-rehash - zsh)"

    alias nodes="nodenv versions"

    function current_node() {
        echo "$(nodenv version-name)"
    }

    function npm_packages() {
        local nodenv_path=$(nodenv prefix)
		npm list --depth 0 $@
        # gem list $@ | sed -E \
        #   -e "s/\([0-9a-z, \.]+( .+)?\)/$fg[blue]&$reset_color/g" \
        #   -e "s|$(echo $rbenv_path)|$fg[magenta]\$rbenv_path$reset_color|g" \
        #   -e "s/$current_ruby@global/$fg[yellow]&$reset_color/g" \
        #   -e "s/$current_ruby$current_gemset$/$fg[green]&$reset_color/g"
    }

    function nodenv_prompt_info() {
		echo "$(current_ruby)"
    }
else
    alias nodes="node -v"
    function current_node() { echo "not supported" }
    function npm_packages() { echo "not supported" }
    function nodenv_prompt_info() { echo "system: $(nod -v | cut -f-2 -d ' ')" }
fi

unset FOUND_NODENV nodenvdirs dir
