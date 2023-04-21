#!/usr/bin/env bash
set -euo pipefail
set -x
script=$(realpath "$0")
script_dir=$(dirname "$script")

# shellcheck source-path=SCRIPTDIR
source "$script_dir/user-manifest.sh"

is_available() {
     if [[ -n "$(apt-cache search --names-only "$1")" ]]; then
	     return $(true)
     fi

     return $(false)
}

filter_if_available() {
     if is_available "$1" 2>/dev/null; then
	echo "$1"
     else
	echo ""
     fi
}

filter_broken() {
	export -f is_available
	export -f filter_if_available
	IFS=$'\n' readarray -t out < <(cat "$1" | xargs -I{} -P0 sh -c 'filter_if_available {}')
	IFS=$'\n' echo "${out[@]}"
}


if [ "$0" = "${BASH_SOURCE[0]}" ]; then
	#apt-get update 
	#apt-get upgrade
	#apt-get install -y apt-fast
    	
	out=()
	IFS=$'\n' readarray -t out < <(filter_broken <(cat "$1"))


	g=32
	for ((i=0; i < ${#out[@]}; i+=g))
	do
		apt-fast install -y ${out[@]:i:g}
	done
fi

set +euo pipefail
