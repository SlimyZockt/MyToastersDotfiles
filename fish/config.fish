if status is-interactive
    abbr --add dt dot-tool '~/.config/MyToastersDotfiles/'
    # Commands to run in interactive sessions can go here
    set fish_greeting ""
    set -x PATH "/home/myt/.cargo/bin" $PATH
    set -x PATH "/home/myt/go/bin" $PATH
    set -x PATH "/home/myt/.local/bin" $PATH
    # set -x PATH "/home/myt/.local/bin/nvim-linux-x86_64/bin" $PATH
    set -g fish_key_bindings fish_vi_key_bindings
    set SSH_ASKPASS ""
    set -Ux MANPAGER "nvim +Man!"
    set -Ux EDITOR "nvim"
    set -Ux VISUAL "nvim"
    set -Ux JJ_EDITOR "nvim"
    set -Ux CARAPACE_BRIDGES 'zsh,fish,bash,inshellisense' # optional

    set -gx LDFLAGS "-L/usr/lib/llvm20/lib"
    set -gx CPPFLAGS "-I/usr/lib/llvm20/include"

    starship init fish | source
    fzf --fish | source
    carapace _carapace | source
    fastfetch
    alias vim nvim
end

function fish_user_key_bindings
    bind -a \cf 'tms'
    bind yy fish_clipboard_copy
    bind Y fish_clipboard_copy
    bind P fish_clipboard_pase
end

# pnpm
set -gx PNPM_HOME "/home/myt/.local/share/pnpm"
if not string match -q -- $PNPM_HOME $PATH
  set -gx PATH "$PNPM_HOME" $PATH
end
# pnpm end

# Added by LM Studio CLI (lms)
set -gx PATH $PATH /home/myt/.lmstudio/bin
# End of LM Studio CLI section

