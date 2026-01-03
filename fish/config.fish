set -g fish_greeting

# disable direnv warning?
set -gx DIRENV_WARN_TIMEOUT 0

# use `difftastic` for git diff
set -gx GIT_EXTERNAL_DIFF difft

# XDG base dirs
set -gx XDG_DATA_HOME $HOME/.local/share
set -gx XDG_CONFIG_HOME $HOME/.config
set -gx XDG_STATE_HOME $HOME/.local/state
set -gx XDG_CACHE_HOME $HOME/.cache

# rust home dirs
set -gx RUSTUP_HOME $XDG_DATA_HOME/rustup
set -gx CARGO_HOME $XDG_DATA_HOME/cargo

#nix
source "/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.fish"
fish_add_path -gP $XDG_STATE_HOME/nix/profile/bin

fish_add_path $HOME/.cargo/bin
fish_add_path /opt/rocm/bin
fish_add_path /opt/cuda/bin
fish_add_path $HOME/.local/bin
fish_add_path $HOME/.local/share/coursier/bin
# convenience cmds for dotfile management
function dotpush -a commitname
    echo "Pushing config to dotted-files repo"
    pushd ~/dotted-files/
    ~/dotted-files/pull
    git commit -am $commitname
    git push
    popd
end
function dotpull
    echo "Pulling config from dotted-files repo and applying"
    pushd ~/dotted-files/
    git pull
    ~/dotted-files/apply
    popd
end
#interactive
if status is-interactive
    starship init fish | source
    direnv hook fish | source

    alias ls 'eza --icons=auto'
    alias lla 'll -a'
    alias cat bat
    alias du dust
    alias tree erd
    alias rq 'dnf repoquery'
    # alias push='echo("Pushing config to dotted-files"); ~/dotted-files/pull; git commit -c ~/dotted-files/ -a && git push'
    # alias pull='echo("Pulling config from dotted-files"); git pull -c ~/dotted-files/ ; ~/dotted-files/apply '

    pfetch
end
zoxide init fish | source
