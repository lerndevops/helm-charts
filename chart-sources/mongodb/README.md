## Get Repo Info

```console
helm repo add lerndevops https://lerndevops.github.io/helm-charts/
helm repo update
```

## Install Chart

```console
# Helm 3
$ helm install [RELEASE_NAME] lerndevops/mongodb
```

## Uninstall Chart

```console
# Helm 3
$ helm uninstall [RELEASE_NAME]
```

## Upgrade Chart

```console
# Helm 3
$ helm upgrade [RELEASE_NAME] lerndevops/mongodb
```

