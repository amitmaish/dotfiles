#!/usr/bin/env bash

timew "$@" >/dev/null

[ "$(timew get dom.active)" -eq 1 ] || {
	tmux set -g @timeme_status ""
	exit 0
}

status=$(timew | head --lines 1)
status=${status:9}

tmux set -g @timeme_status "$status"
