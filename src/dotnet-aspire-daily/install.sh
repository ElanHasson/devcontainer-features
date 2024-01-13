#!/bin/sh
set -e

echo "Activating feature 'aspire'"

dotnet workload update
dotnet workload update --skip-sign-check --source https://pkgs.dev.azure.com/dnceng/public/_packaging/dotnet8/nuget/v3/index.json
dotnet workload install aspire --skip-sign-check --source https://pkgs.dev.azure.com/dnceng/public/_packaging/dotnet8/nuget/v3/index.json
cp NuGet.config.x "${workspaceFolder}/LOOK-HERE-ASPIRE-NuGet.Config"
