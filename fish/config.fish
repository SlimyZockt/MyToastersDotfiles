abbr --add dt dot-tool '~/.config/DotTool/'

if status is-interactive
    # Commands to run in interactive sessions can go here
    set fish_greeting ""
    set -x PATH "/home/myt/.cargo/bin" $PATH
    set -x PATH "/home/myt/go/bin" $PATH
    set -x PATH "/home/myt/.local/bin" $PATH
    set -g fish_key_bindings fish_vi_key_bindings
    set SSH_ASKPASS ""
    starship init fish | source
    fzf --fish | source
    set SSH_ASKPASS ""
    set -Ux MANPAGER "nvim +Man!"
    set -Ux CARAPACE_BRIDGES 'zsh,fish,bash,inshellisense' # optional
    carapace _carapace | source
    fastfetch
    set NIX_LD $(nix eval --impure --raw --expr '
let pkgs = import <nixpkgs> {}; NIX_LD = pkgs.lib.fileContents "${pkgs.stdenv.cc}/nix-support/dynamic-linker"; in NIX_LD ')
end

function fish_user_key_bindings
    bind -a \cf 'tms'
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

