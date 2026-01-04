#!/bin/bash
netscan() { python3 "$HOME/dotfiles/python/hacking/netscan.py" "$@"; }
sysup() { sudo apt update && sudo apt full-upgrade -y && sudo apt autoremove -y; }
dotsync() {
    msg="${1:-Auto-Sync via Linux}"
    repo="$HOME/dotfiles"
    if [ -f "$repo/gendocs.py" ]; then python3 "$repo/gendocs.py"; fi
    git -C "$repo" add . && git -C "$repo" commit -m "$msg"
    git -C "$repo" pull --rebase && git -C "$repo" push
}
