if status is-interactive
    set -g fish_key_bindings fish_vi_key_bindings
    set fish_greeting ""
        # Commands to run in interactive sessions can go here
    starship init fish | source
    set SSH_ASKPASS ""
    fastfetch
end
