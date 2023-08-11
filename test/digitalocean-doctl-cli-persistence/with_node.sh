#!/bin/bash

set -e

# Optional: Import test library
source dev-container-features-test-lib

# check that `doctl --help` works
check "help" bash -c "doctl --help | grep 'doctl is a command line interface (CLI) for the DigitalOcean API.'"

# check that `.config/doctl` and `/dc/digitalocean-doctl-cli` exist under the user (should be node)
check "config" bash -c "ls -la ~/.config | grep 'doctl'"
check "dc" bash -c "ls -la /dc | grep 'digitalocean-doctl-cli'"

# check that the folders are owned by the user
# `stat -c "%U %G" ~/.config` returns "$USER $GROUP", in this case "node node"
# https://askubuntu.com/a/175060
check "~/.config/doctl owned by user" bash -c "test \"$(stat -c "%U %G" ~/.config)\" = 'node node'"
check "/dc/digitalocean-doctl-cli owned by user" bash -c "test \"$(stat -c "%U %G" /dc/digitalocean-doctl-cli)\" = 'node node'"

# Report result
reportResults
