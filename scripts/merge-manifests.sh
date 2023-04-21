#!/usr/bin/env bash

names() {
	awk '{ print $1 }' "$1" | sort -u
}

merge() {
	add="$1"
	rem="$2"

	grep -v -Ff <(names "$rem") <(names "$add")
}

if [ "$0" = "${BASH_SOURCE[0]}" ]; then
	set -euo pipefail
	if [ "$#" -lt "2" ]; then
		echo "usage: $0 <add> <remove>"
		exit 1
	fi

	merge "$1" "$2"
	set +euo pipefail
fi

