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
check "Make sure Aspire Workload is installed. grep returns 0 if found." test "$(dotnet workload list | grep aspire | echo $?)" = "0"

check "Ensure NuGet.config is copied to workspaceFolder" test -f "${workspaceFolder}/LOOK-HERE-ASPIRE-NuGet.Config"

reportResults
