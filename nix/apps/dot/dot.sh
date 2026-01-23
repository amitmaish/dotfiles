# a script to edit my config and rebuild nix if changes were made

set -e

red=$(tput setaf 1)
reset_color=$(tput setaf 9)

force=false
git_push=false
notify=true

reset() {
	popd >/dev/null
	exit "$1"
}

show_help() {
	cat <<-EOF
		dot: a command to rebuild configs
		flags:
			-f  force rebuild even when there weren't changes
			-h  help
			-N  disable notificaitons
			-p  run git pull before editing config
			-P  git push after config is done
			-r  rebuild without editing configs
	EOF
}

pushd ~/dotfiles/ >/dev/null

while getopts "fhNpPr" arg; do
	case "$arg" in
	f) force=true ;;
	h) show_help ;;
	N) notify=false ;;
	p) git pull ;;
	P) git_push=true ;;
	r)
		eval "$REBUILD_COMMAND" 2>&1 || (
			printf "\n%s\n" "${red}rebuild failed!${reset_color}" && reset 1
		)
		reset 0
		;;
	*)
		echo "invalid flag: $arg"
		show_help
		reset 1
		;;
	esac
done

$EDITOR

if [[ $force == false ]]; then
	if git diff --quiet; then
		reset 0
	fi
fi

if [[ ($force == true) || (! $(git diff --quiet "./nix/*")) ]]; then

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

	if [[ $git_push == true ]]; then
		git push
	fi

	if $notify; then
		$NOTIFY_COMMAND
	fi

fi

reset 0
