#!/usr/bin/env bash

eval "$(readlink -f "$(which qutebrowser)" | sed "s/\/bin\/qutebrowser/\/share\/qutebrowser\/userscripts\/password_fill/g") $*"
