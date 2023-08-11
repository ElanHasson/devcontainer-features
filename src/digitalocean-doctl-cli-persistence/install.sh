#!/bin/sh
set -e

echo "Activating feature 'digitalocean-doctl-cli-persistence'"
echo "User: ${_REMOTE_USER}     User home: ${_REMOTE_USER_HOME}"

if [ -z "${_REMOTE_USER}" ] || [ -z "${_REMOTE_USER_HOME}" ]; then
  echo "***********************************************************************************"
  echo "*** Require _REMOTE_USER and _REMOTE_USER_HOME to be set (by dev container CLI) ***"
  echo "***********************************************************************************"
  exit 1
fi

# Make ~/.config folder if doesn't exist
mkdir -p "${_REMOTE_USER_HOME}/.config"
mkdir -p "/dc/digitalocean-doctl-cli"

# If `.config/doctl` exists, isn't a symlink, and /dc/digitalocean-doctl-cli is empty, move contents
if [ -e "${_REMOTE_USER_HOME}/.config/doctl" ] &&
  [ ! -L "${_REMOTE_USER_HOME}/.config/doctl" ] &&
  [ ! "$(ls -A /dc/digitalocean-doctl-cli)" ]; then
  echo "Moving existing doctl folder contents to /dc/digitalocean-doctl-cli"
  mv "${_REMOTE_USER_HOME}/.config/doctl/." /dc/digitalocean-doctl-cli/
  rmdir "${_REMOTE_USER_HOME}/.config/doctl"
else
  echo "No existing doctl configuration found."
fi

# Create symlink if it doesn't already exist
if [ ! -L "${_REMOTE_USER_HOME}/.config/doctl" ]; then
  ln -s /dc/digitalocean-doctl-cli "${_REMOTE_USER_HOME}/.config/doctl"
fi

# Change ownership
chown -R "${_REMOTE_USER}:${_REMOTE_USER}" "${_REMOTE_USER_HOME}/.config"
chown -R "${_REMOTE_USER}:${_REMOTE_USER}" /dc/digitalocean-doctl-cli
