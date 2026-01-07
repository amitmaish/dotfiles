# a script to edit my config and rebuild nix if changes were made

set -e

red="\e[1;31m%s\e[0m\n"

pushd ~/dotfiles/

printf "\n"

$EDITOR

if git diff --quiet; then
	popd
	exit 0
fi

if ! git diff --quiet "./nix/*"; then

	alejandra "./nix/*" &>/dev/null || (
		printf "\n%s%s" "$red" "formatting failed!" && exit 1
	)

	git diff -U0 nix/*

	printf "\n%s\n" "rebuilding nixos"

	# shellcheck disable=SC2024
	sudo nixos-rebuild switch --flake ~/dotfiles/nix#amit &>nixos-switch.log || (
		cat nixos-switch.log | grep --color error && exit 1
	)

	current=$(nu -c "nixos-rebuild list-generations | detect columns | where {|item| \$item.Current == True} | \$in.Generation.0")

	git commit -am "nix - gen $current" || (
		printf "\n%s" "commit failed"
		exit 1
	)

	notify-send -e "nixos rebuild ok!" --icon=software-update-available

fi

popd
