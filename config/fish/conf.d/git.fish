if ! type -q git
    echo "Couldn't enable Git aliases ; 'apt install git' to enable them."
else
    set __fish_git_prompt_showdirtystate
    set __fish_git_prompt_showuntrackedfiles

    alias gaa="git add --all"
    alias gapa="git add --patch"
    alias gb="git branch -v"
    alias gbc="git branch --show-current"
    alias gc="git commit -v"
    alias gc!="git commit -v --amend"
    alias gca="git commit -v --all"
    alias gca!="git commit -v --all --amend"
    alias gco="git checkout"
    alias gcp="git cherry-pick"
    alias gd="git diff"
    alias gdca="git diff --cached"
    alias gfa="git fetch --all --prune --jobs=10"
    alias glo="git log --oneline --decorate"
    alias grb="git rebase"
    alias groh="git reset origin/(git branch --show-current) --hard"
    alias gsh="git show"
    alias gst="git status"

    function git_branches_gone
        LANG=C git branch -v | string match -e -r "^\*" -v | string match -e "[gone]" | string trim | cut -d " " -f 1
    end

    function grsth --wraps "git reset"
        if test -z $argv[1]
            echo "Remote name is empty. Please provide one."
        else
            git reset $argv[1]/(git branch --show-current) --hard
        end
    end
end
