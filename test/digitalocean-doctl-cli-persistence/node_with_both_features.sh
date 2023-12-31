#!/bin/bash
set -e
source dev-container-features-test-lib

whoami
ls -las ~/

ls -las /dc
ls -lasR "${HOME}/.config"

# Existing doctl configuration checks
check "Symlink exists: ${HOME}/.config/doctl" [ -L "${HOME}/.config/doctl" ]
check "Symlink points to the right location" [ "$(readlink ${HOME}/.config/doctl)" = "/dc/digitalocean-doctl-cli" ]
# Can't seem to write the file BEFORE the feature executes
# check "Test file was migrated" [ -f "/dc/digitalocean-doctl-cli/test.txt" ]



owner=$(stat -c '%U' /dc/digitalocean-doctl-cli)
if [ "$owner" -ne "UNKNOWN"]; then
    check "Ownership of symlink is correct" [ "$symlink_owner" = "$(whoami)" ]
fi

symlink_owner=$(stat -c '%U' "$HOME/.config/doctl")
if [ "$symlink_owner" -ne "UNKNOWN"]; then
    check "Ownership of symlink is correct" [ "$symlink_owner" = "$(whoami)" ]
fi

reportResults
