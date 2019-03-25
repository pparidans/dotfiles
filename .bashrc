# use decent & 'modern' term type
TERM="xterm-256color"

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

# add user's bin to path
PATH="$DIR/bin:$PATH"

# setup bash-git-prompt
GIT_PROMPT_ONLY_IN_REPO=1
#source ~/.bash-git-prompt/gitprompt.sh
source "$DIR/lib/bash-git-prompt/gitprompt.sh"

# enable user-installed Python Packages
PATH="$HOME/.local/bin:$PATH"

# enable RBenv
if [ -d "$HOME/.rbenv" ]; then
    PATH="$HOME/.rbenv/bin:$PATH"
fi
if command -v rbenv 1>/dev/null 2>&1; then
    eval "$(rbenv init -)"
fi

