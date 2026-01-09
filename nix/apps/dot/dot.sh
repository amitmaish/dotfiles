# a script to edit my config and rebuild nix if changes were made

set -e

red="\e[1;31m%s\e[0m\n"

pushd ~/dotfiles/ >dev/null

git pull >dev/null

printf "\n"

$EDITOR

if git diff --quiet; then
	popd >dev/null
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
		popd >dev/null
		exit 1
	)

	notify-send -e "nixos rebuild ok!" -a "dot" --icon=software-update-available

fi

popd >dev/null
