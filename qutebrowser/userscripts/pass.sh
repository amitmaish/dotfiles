#!/usr/bin/env bash

eval "$(readlink -f "$(which qutebrowser)" | sed "s/\/bin\/qutebrowser/\/share\/qutebrowser\/userscripts\/qute-pass/g") $*"
