/Users/amit/.cargo/bin/starship init fish | source

set MANPAGER "sh -c 'col -bx | bat -l man -p'"
set -gx EDITOR nvim

if status is-interactive
    # Commands to run in interactive sessions can go here
end

function y
    set tmp (mktemp -t "yazi-cwd.XXXXXX")
    set TERM xterm-kitty yazi
    yazi $argv --cwd-file="$tmp"
    if read -z cwd <"$tmp"; and [ -n "$cwd" ]; and [ "$cwd" != "$PWD" ]
        builtin cd -- "$cwd"
    end
    rm -f -- "$tmp"
end

direnv hook fish | source
fzf --fish | source
zoxide init fish --cmd cd | source
