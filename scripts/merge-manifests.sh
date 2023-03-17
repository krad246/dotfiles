#!/usr/bin/env bash
set -euxo pipefail

names() {
	awk '{ print $1 }' "$1" | sort -u
}

merge() {
	add="$1"
	rem="$2"
	comm --check-order -23 <(names "$add") <(names "$rem")
}

if [ "$0" = "${BASH_SOURCE[0]}" ]; then
	if [ "$#" -lt "2" ]; then
		echo "usage: $0 <add> <remove>"
		exit 1
	fi

	merge "$1" "$2"
fi

set +euxo pipefail
