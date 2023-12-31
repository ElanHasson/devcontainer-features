#!/bin/bash
set -e
source dev-container-features-test-lib

whoami
ls -las ~/

ls -las /dc
ls -lasR "${HOME}/.config"

# Duplicate installation checks
check "Only one symlink exists" [ "$(find $HOME/.config -name 'doctl' | wc -l)" = "1" ]
check "Symlink points to the right location" [ "$(readlink $HOME/.config/doctl)" = "/dc/digitalocean-doctl-cli" ]

owner=$(stat -c '%U' /dc/digitalocean-doctl-cli)
if [ "$owner" -ne "UNKNOWN"]; then
    check "Ownership of symlink is correct" [ "$symlink_owner" = "$(whoami)" ]
fi

symlink_owner=$(stat -c '%U' "$HOME/.config/doctl")
if [ "$symlink_owner" -ne "UNKNOWN"]; then
    check "Ownership of symlink is correct" [ "$symlink_owner" = "$(whoami)" ]
fi

reportResults
