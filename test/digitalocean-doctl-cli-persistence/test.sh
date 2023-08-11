#!/bin/bash
set -e
source dev-container-features-test-lib

# NOTE: this is an "auto-generated" test, which means it will be
# executed against an auto-generated devcontainer.json that
# includes the 'digitalocean-doctl-cli-persistence' Feature with no options.
#
# https://github.com/devcontainers/cli/blob/main/docs/features/test.md
#
# From my tests, this means the `doctl` CLI will not be installed:
# Thus, here, I only check basic directory existence

# Default behavior checks
ls -las ~/
whoami
ls -las /dc

check "Symlink exists" test -L "$HOME/.config/doctl"
check "Symlink points to the right location" test "$(readlink "$HOME/.config/doctl")" = "/dc/digitalocean-doctl-cli"


owner=$(stat -c '%U' /dc/digitalocean-doctl-cli)
if [ "$owner" -ne "UNKNOWN"]; then
    check "Ownership of symlink is correct" [ "$symlink_owner" = "$(whoami)" ]
fi

symlink_owner=$(stat -c '%U' "$HOME/.config/doctl")
if [ "$symlink_owner" -ne "UNKNOWN"]; then
    check "Ownership of symlink is correct" [ "$symlink_owner" = "$(whoami)" ]
fi

reportResults
