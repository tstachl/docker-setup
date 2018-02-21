#!/bin/sh
set -euo pipefail

# first arg is `-f` or `--some-option`
if [ "${1#-}" != "$1" ]; then
	set -- /usr/sbin/nginx-helper "$@"
fi

exec "$@"