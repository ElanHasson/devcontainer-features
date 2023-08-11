#!/bin/bash

set -e

# Optional: Import test library
source dev-container-features-test-lib

# check that `~/.config/doctl` and `/dc/digitalocean-doctl-cli` exist`
check "config" bash -c "ls -la ~/.config | grep 'doctl'"
check "dc" bash -c "ls -la /dc | grep 'digitalocean-doctl-cli'"

# check that `~/.config/doctl` is a symlink
# https://unix.stackexchange.com/a/96910
check "~/.config/doctl is a symlink" bash -c "test -L ~/.config/doctl && test -d ~/.config/doctl"


# Report result
reportResults

