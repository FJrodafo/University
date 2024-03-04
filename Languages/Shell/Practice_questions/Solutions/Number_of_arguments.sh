#!/bin/bash

set -eu

main() {
    case $# in
        0) printf "%s\n" "Usage: ./<program name> <argument>"; return 1 ;;
        1) printf "%s\n" "Got it: $1"; return 0 ;;
        *) printf "%s\n" "hey hey...too many!"; return 0 ;;
    esac
}

main "$@"
