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

owner=$(stat -c '%U' /dc/digitalocean-doctl-cli)
if [ "$owner" -ne "UNKNOWN"]; then
    check "Ownership of symlink is correct" [ "$symlink_owner" = "$(whoami)" ]
fi

symlink_owner=$(stat -c '%U' "$HOME/.config/doctl")
if [ "$symlink_owner" -ne "UNKNOWN"]; then
    check "Ownership of symlink is correct" [ "$symlink_owner" = "$(whoami)" ]
fi

check "doctl command is available" which doctl

reportResults
