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
rebuild() {
	eval "${REBUILD_COMMAND}" 2>&1 || (
		printf "\n%s\n" "${red}rebuild failed${reset_color}" && reset 1
	)
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
get_args() {
	while getopts "fhNpPr" arg; do
		case "$arg" in
		f) force=true ;;
		h) show_help ;;
		N) notify=false ;;
		p) git pull ;;
		P) git_push=true ;;
		r) rebuild && reset 0 ;;
		*)
			echo "invalid flag: $arg"
			show_help
			reset 1
			;;
		esac
	done
}

main() {
	pushd ~/dotfiles/ >/dev/null
	trap '$(reset 0)' EXIT

	get_args

	eval "$EDITOR"

	# exit if unchanged
	if [[ ($force == false) && $(git diff --quiet) ]]; then
		reset 0
	fi

	# check for nix changes
	if [[ ($force == true) || (! $(git diff --quiet "./nix/*")) ]]; then

		alejandra ./nix/* &>/dev/null || (
			printf "\n%s" "''${red}formatting failed!" && reset 1
		)

		git diff -U0 nix/*

		printf "\n%s\n" "rebuilding config"

		rebuild

		current=$(eval "${CURRENT_COMMAND}")

		git commit -am "nix - ${NAME} gen $current" || (
			printf "\n%s" "commit failed"
			reset 1
		)

		if [[ $git_push == true ]]; then
			git push
		fi

		if $notify; then
			eval "${NOTIFY_COMMAND}"
		fi

	fi

	reset 0
}

main
