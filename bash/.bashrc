bind 'set show-all-if-ambiguous on'
bind 'TAB:menu-complete'

function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		builtin cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}

alias cd="z"

eval "$(zoxide init bash)"
eval "$(starship init bash)"
. "$HOME/.cargo/env"
