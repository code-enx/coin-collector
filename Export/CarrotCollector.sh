#!/bin/sh
printf '\033c\033]0;%s\a' CoinCollector
base_path="$(dirname "$(realpath "$0")")"
"$base_path/CarrotCollector.x86_64" "$@"
