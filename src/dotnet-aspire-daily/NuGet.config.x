<?xml version="1.0" encoding="utf-8"?>
<!-- THIS FILE SHOULD BE MERGED INTO YOUR NuGet.config -->

<configuration>
    <packageSources>
        <clear />
        <add key="nuget" value="https://api.nuget.org/v3/index.json" />
        <add key="dotnet-public" value="https://pkgs.dev.azure.com/dnceng/public/_packaging/dotnet-public/nuget/v3/index.json" />
        <add key="dotnet-eng" value="https://pkgs.dev.azure.com/dnceng/public/_packaging/dotnet-eng/nuget/v3/index.json" />
        <add key="dotnet8" value="https://pkgs.dev.azure.com/dnceng/public/_packaging/dotnet8/nuget/v3/index.json" />
        <add key="dotnet-libraries" value="https://pkgs.dev.azure.com/dnceng/public/_packaging/dotnet-libraries/nuget/v3/index.json" />
        <add key="orleans-nightly" value="https://orleans.pkgs.visualstudio.com/orleans-public/_packaging/orleans-nightly/nuget/v3/index.json" />
    </packageSources>
    <packageSourceMapping>
        <packageSource key="dotnet-public">
            <package pattern="*" />
        </packageSource>
        <packageSource key="dotnet8">
            <package pattern="*" />
        </packageSource>
        <packageSource key="dotnet-libraries">
            <package pattern="Microsoft.DeveloperControlPlane*" />
            <package pattern="System.CommandLine" />
        </packageSource>
        <packageSource key="dotnet-eng">
            <package pattern="*" />
        </packageSource>
        <packageSource key="orleans-nightly">
            <package pattern="Microsoft.Orleans.*" />
        </packageSource>
        <packageSource key="nuget">
            <package pattern="*" />
        </packageSource>
    </packageSourceMapping>
    <disabledPackageSources />
</configuration>
