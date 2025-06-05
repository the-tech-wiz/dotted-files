set -g fish_greeting

fish_add_path /opt/rocm/bin
fish_add_path /opt/cuda/bin
fish_add_path $HOME/.cargo/bin
fish_add_path $HOME/.local/bin
fish_add_path $HOME/.local/share/coursier/bin

if status is-interactive
    if ! test -z $XDG_CURRENT_DESKTOP && test -z $TMUX
        if test $TMUX_ATTACH
            exec tmux new -As inf
        else
            exec tmux new
        end
    end

    pfetch
    starship init fish | source
    direnv hook fish | source

    alias ls 'eza --icons=auto'
    alias lla 'll -a'
    alias cat bat
    alias du dust
    alias tree erd
end
