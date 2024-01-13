
# Persistence for DigitalOcean doctl CLI (digitalocean-doctl-cli-persistence)

Avoid extra logins from the DigitalOcean CLI (doctl) by preserving the `~/.config/doctl` folder across container instances.

## Example Usage

```json
"features": {
    "ghcr.io/ElanHasson/devcontainer-features/digitalocean-doctl-cli-persistence:1": {}
}
```

## Options

| Options Id | Description | Type | Default Value |
|-----|-----|-----|-----|


## Changelog

| Version | Notes                                                |
| ------- | ---------------------------------------------------- |
| 1.1.0   | Improved ownership handling and added support to merge any existing doctl configuration into new folder so no configuration is lost. |
| 1.0.0   | Initial Version                                      |

## OS and Architecture Support

|        | amd64 | arm64 |
| ------ | ----- | ----- |
| ubuntu | ✅     | ❓     |
| debian | ✅     | ❓     |

- ✅: Tested and verified on Github Actions
- ❓: Who knows?

## References

- [DigitalOcean CLI Feature](https://github.com/devcontainers-contrib/features/tree/main/src/digitalocean-cli)
- [joshuanian/github-cli-persistence](https://github.com/joshuanianji/devcontainer-features/tree/main/src/github-cli-persistence)


---

_Note: This file was auto-generated from the [devcontainer-feature.json](https://github.com/ElanHasson/devcontainer-features/blob/main/src/digitalocean-doctl-cli-persistence/devcontainer-feature.json).  Add additional notes to a `NOTES.md`._
