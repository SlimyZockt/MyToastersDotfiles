if status is-interactive
    # Commands to run in interactive sessions can go here
    set fish_greeting ""
    set -x PATH "/home/myt/.cargo/bin" $PATH
    set -x PATH "/home/myt/.local/bin" $PATH
    set -g fish_key_bindings fish_vi_key_bindings
    set SSH_ASKPASS ""
    starship init fish | source
    fzf --fish | source
    set -Ux CARAPACE_BRIDGES 'zsh,fish,bash,inshellisense' # optional
    carapace _carapace | source
    fastfetch
end

function fish_user_key_bindings
    bind -a \cf 'tms'
end
