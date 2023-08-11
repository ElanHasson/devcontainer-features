#!/bin/bash

set -e

# Optional: Import test library
source dev-container-features-test-lib

# NOTE: this is an "auto-generated" test, which means it will be 
# executed against an auto-generated devcontainer.json that
# includes the 'digitalocean-doctl-cli-persistence' Feature with no options.
#
# https://github.com/devcontainers/cli/blob/main/docs/features/test.md
#
# From my tests, this means the `doctl` CLI will not be installed:
# Thus, here, I only check basic directory existence


# check that `~/.config/doctl` and `/dc/digitalocean-doctl-cli` exist`
check "config" bash -c "ls -la ~/.config | grep 'doctl'"
check "dc" bash -c "ls -la /dc | grep 'digitalocean-doctl-cli'"

# check that `~/.config/doctl` is a symlink
# https://unix.stackexchange.com/a/96910
check "~/.config/doctl is a symlink" bash -c "test -L ~/.config/doctl && test -d ~/.config/doctl"

# check that the folders are owned by the user
# `stat -c "%U %G" ~/.config` returns "$USER $GROUP", in this case "node node"
# https://askubuntu.com/a/175060
check "~/.config/doctl owned by user" bash -c "test \"$(stat -c "%U %G" ~/.config)\" = 'node node'"
check "/dc/digitalocean-doctl-cli owned by user" bash -c "test \"$(stat -c "%U %G" /dc/digitalocean-doctl-cli)\" = 'node node'"

# Report result
reportResults

