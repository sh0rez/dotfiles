#!/bin/bash
set -e;

function eat {
        trap 'networksetup -setsocksfirewallproxystate "Wi-Fi" off' EXIT
        networksetup -setsocksfirewallproxy "Wi-Fi" "localhost" "8123"
        ssh -D 8123 -C -q -N circular
}

function ghost {
        ssh -L 1194:braack.cloud:1194 circular ./cow
}

case "$1" in
        "eat" )
                eat;;
        "ghost" )
                ghost;;
esac

