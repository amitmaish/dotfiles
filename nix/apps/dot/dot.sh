# a script to edit my config and rebuild nix if changes were made

set -e

red="\e[1;31m%s\e[0m\n"

reset() {
	popd >/dev/null
	exit "$1"
}

pushd ~/dotfiles/ >/dev/null

git pull >/dev/null

$EDITOR

if git diff --quiet; then
	reset 0
fi

if ! git diff --quiet "./nix/*"; then

	alejandra "./nix/*" &>/dev/null || (
		printf "\n%s%s" "$red" "formatting failed!" && reset 1
	)

	git diff -U0 nix/*

	printf "\n%s\n" "rebuilding nixos"

	doppler run --command="echo \$NIX_MODARTT_USERNAME"

	# shellcheck disable=SC2024
	doppler run --command="sudo nixos-rebuild switch --flake ~/dotfiles/nix#amit" &>nixos-switch.log || (
		cat nixos-switch.log | grep --color error && reset 1
	)

	current=$(nu -c "nixos-rebuild list-generations | detect columns | where {|item| \$item.Current == True} | \$in.Generation.0")

	git commit -am "nix - gen $current" || (
		printf "\n%s" "commit failed"
		reset 1
	)

	notify-send -e "nixos rebuild ok!" -a "dot" --icon=software-update-available

fi

reset 0
