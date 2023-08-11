#!/bin/sh
set -e

echo "Activating feature 'digitalocean-doctl-cli-persistence'"
echo "User: ${_REMOTE_USER}     User home: ${_REMOTE_USER_HOME}"

if [  -z "$_REMOTE_USER" ] || [ -z "$_REMOTE_USER_HOME" ]; then
  echo "***********************************************************************************"
  echo "*** Require _REMOTE_USER and _REMOTE_USER_HOME to be set (by dev container CLI) ***"
  echo "***********************************************************************************"
  exit 1
fi

# make ~/.config folder if doesn't exist
mkdir -p "$_REMOTE_USER_HOME/.config"
mkdir -p "/dc/digitalocean-doctl-cli"

# if `.config/doctl` already exists, the `ln -s` command will create an extra 
# folder *inside* `.config/doctl` that symlinks to `digitalocean-doctl-cli`
# Thus, we want to make sure the folder does NOT exist so the symlink will actually be to ~/.config/doctl
if [ -e "$_REMOTE_USER_HOME/.config/doctl" ]; then
  echo "Moving existing doctl folder to doctl-old"
  mv "$_REMOTE_USER_HOME/.config/doctl" "$_REMOTE_USER_HOME/.config/doctl-old"
fi

ln -s /dc/digitalocean-doctl-cli "$_REMOTE_USER_HOME/.config/doctl"
# chown the entire `.config` folder because devcontainers creates 
# a `~/.config/vscode-dev-containers` folder later on 
chown -R "${_REMOTE_USER}:${_REMOTE_USER}" "$_REMOTE_USER_HOME/.config"

# chown mount (only attached on startup)
cat << EOF >> "$_REMOTE_USER_HOME/.bashrc"
sudo chown -R "${_REMOTE_USER}:${_REMOTE_USER}" /dc/digitalocean-doctl-cli
EOF
chown -R $_REMOTE_USER $_REMOTE_USER_HOME/.bashrc
