source /usr/share/cachyos-fish-config/cachyos-config.fish

if status is-interactive
    set -g theme_display_git_default_branch yes
    set -g theme_title_display_process yes
    set -g theme_title_display_path no
    set -g theme_title_use_abbreviated_path no
    set -g theme_date_format "+%d/%m/%y %H:%M"
    set -g theme_display_user yes
    set -g theme_display_hostname yes
    set -g fish_prompt_pwd_dir_length 6
    set -g theme_display_jobs_verbose yes
end

set -g __fish_git_prompt_showdirtystate 'yes'
set -g __fish_git_prompt_showuntrackedfiles 'yes'
set -g __fish_git_prompt_showupstream 'informative'
set -g __fish_git_prompt_color_branch yellow
set -g __fish_git_prompt_color_dirtystate red
set -g __fish_git_prompt_color_stagedgreen



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
function git_main_branch
    git symbolic-ref --quiet --short refs/remotes/origin/HEAD 2>/dev/null | string replace 'origin/' ''
end

function current_branch
    git symbolic-ref --quiet --short HEAD 2>/dev/null
end

alias gsts="git status"
alias gst="gsts"
alias gsta="git status"
alias ga="git add"
alias gaa="git add ."
alias gm="git commit"
alias gps="git push"
alias gpsf="git push --force-with-lease"
alias gbl="git branch --list"
alias gco="git checkout"
alias gcb="git checkout -b"
alias gf="git fetch"
alias gp="git pull"

function gma
    gaa
    and gm
end

function gpsup
    set branch (current_branch)

    if test -z "$branch"
        echo "gpsup: not on a branch (detached HEAD)" >&2
        return 1
    end

    git push --set-upstream origin $branch
end

function gfp
    gf
    and gp
end

function grm
    git rebase (git_main_branch)
end

function gcm
    git checkout (git_main_branch)
end

function grb
    set current (current_branch)

    if test -z "$current"
        echo "grb: detached HEAD" >&2
        return 1
    end

    if test (count $argv) -gt 0
        set base $argv[1]
    else
        set base (git_main_branch)
    end

    if test -z "$base"
        echo "grb: could not determine base branch" >&2
        return 1
    end

    git switch $base
    and git pull --ff-only origin $base
    and git switch $current
    and git rebase $base
end

mise activate fish | source
