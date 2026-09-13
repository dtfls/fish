source /usr/share/cachyos-fish-config/cachyos-config.fish

# overwrite greeting
# potentially disabling fastfetch
#function fish_greeting
#    # smth smth
#end

export EDITOR="vim"


export CDIR="$HOME/.config/"
export fish_file="$CDIR/fish/config.fish"

alias fishl="source $fish_file"
alias fishc="$EDITOR $fish_file"
alias fishs="cat $fish_file"


alias zed="zeditor"

alias spi="sudo pacman -S"
alias sys="sudo systemctl"
alias cls="clear"
alias nv="$EDITOR"
alias edit="$EDITOR"

alias rd="./bin/dev"
alias bi="bundle install"
alias rfl="rails db:fixtures:load"
alias rdbm="rails db:migrate"
alias rs="rails server"
alias rc="rails console"
alias racp="rails assets:clobber assets:precompile"
alias rdbp="rails db:prepare"
alias rdm="rails db:migrate"
alias rddb="rm -rf db/schema.rb & rails db:drop:all"

alias nrd="npm run dev"
alias brd="bun run dev"

alias rdstart="sys start valkey"
alias rdsts="sys status valkey"

# --- = --- GIT ALIASES --- = ---
# Project default branch checkout (override per-machine with: set -Ux GCM_BRANCH <name>)
set -q GCM_BRANCH; or set -g GCM_BRANCH main

alias gsts="git status"
alias gst="gsts"
alias gsta="git status"
alias ga="git add"
alias gaa="git add ."
alias gm="git commit"
alias gma="gaa & gm"
alias gps="git push"
alias gpsf="git push --force-with-lease"
alias gbl="git branch --list"

function gpsup --description 'git push --set-upstream origin <current-branch>'
    set -l branch (git symbolic-ref --quiet --short HEAD)

    if test -z "$branch"
        echo "gpsup: not on a branch (detached HEAD)" >&2
        return 1
    end

    git push --set-upstream origin $branch
end

alias gco="git checkout"
alias gcb="git checkout -b"
alias gf="git fetch"
alias gp="git pull"
alias gfp="gf & gp"
alias grm="git rebase $GCM_BRANCH"

alias gcm="git checkout $GCM_BRANCH"

mise activate fish | source
