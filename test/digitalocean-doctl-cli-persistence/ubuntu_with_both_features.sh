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
check "Ownership of /dc/digitalocean-doctl-cli is correct $owner = ${USER}" [ "$owner" = "${USER}" ]
symlink_owner=$(stat -c '%U' ${HOME}/.config/doctl)
check "Ownership of symlink is correct" [ "$symlink_owner" = "${USER}" ]
check "doctl command is available" which doctl

reportResults
 