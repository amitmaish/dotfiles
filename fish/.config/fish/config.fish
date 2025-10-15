set MANPAGER "sh -c 'col -bx | bat -l man -p'"
set EDITOR nvim

if status is-interactive
	# Commands to run in interactive sessions can go here
end

function y
	set tmp (mktemp -t "yazi-cwd.XXXXXX")
	yazi $argv --cwd-file="$tmp"
	if read -z cwd <"$tmp"; and [ -n "$cwd" ]; and [ "$cwd" != "$PWD" ]
		builtin cd -- "$cwd"
	end
	rm -f -- "$tmp"
end

alias ls="exa"

direnv hook fish | source
fzf --fish | source
zoxide init fish --cmd cd | source
thefuck --alias | source

starship init fish | source

set -q GHCUP_INSTALL_BASE_PREFIX[1]; or set GHCUP_INSTALL_BASE_PREFIX $HOME ; set -gx PATH $HOME/.cabal/bin /Users/amit/.ghcup/bin $PATH # ghcup-env
