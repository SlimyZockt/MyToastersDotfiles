if status is-interactive
    # Commands to run in interactive sessions can go here
    set fish_greeting ""
    set -g fish_key_bindings fish_vi_key_bindings
    set SSH_ASKPASS ""
    starship init fish | source
    fastfetch
end

function fish_user_key_bindings
    bind -a \cf 'tms'
end
