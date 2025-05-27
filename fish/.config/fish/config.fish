/run/current-system/sw/bin/starship init fish | source

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

fzf --fish | source
zoxide init fish --cmd cd | source
