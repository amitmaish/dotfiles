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

	eval "$REBUILD_COMMAND" 2>&1 || (
		printf "\n%s%s\n" "$red" "rebuild failed!" && reset 1
	)

	current=$CURRENT_COMMAND

	git commit -am "nix - $NAME gen $current" || (
		printf "\n%s" "commit failed"
		reset 1
	)

	notify-send -e "nixos rebuild ok!" -a "dot" --icon=software-update-available

fi

reset 0
