## Helm Uninstall

## add repo & install a chart 
```t
# add & Search Helm Repo

    helm repo add lerndevops https://lerndevops.github.io/helm-charts/
    helm search repo lerndevops/nginxdemo

# install a chart from repo 
    helm install sampleapp lerndevops/sampleapp
    helm install mynginx lerndevops/nginxdemo
```
## uninstall Helm Relase - NO FLAGS 
```t
# List Helm Releases
    helm ls

# Uninstall Helm Release
    helm uninstall <RELEASE-NAME>
    helm uninstall mynginx 
    helm uninstall sampleapp
```

## Uninstall Helm Release with --keep-history Flag
```t
# install, upgrade & rollback a Helm Chart
    helm install mynginx lerndevops/nginxdemo --version 0.1
    helm upgrade mynginx lerndevops/nginxdemo --version 0.2
    helm upgrade mynginx lerndevops/nginxdemo --version 0.3
    helm rollback mynginx 

# List Helm Releases
    helm list
    hlem list -f mynginx
    helm list -f mynginx --superseded
    helm list -f mynginx --deployed

# List Release History
    helm history mynginx

# Uninstall Helm Release with --keep-history Flag
    helm uninstall <RELEASE-NAME> --keep-history
    helm uninstall mynginx --keep-history

# List Helm Releases which are uninstalled
    helm list -f mynginx 
    helm list -f mynginx --uninstalled

Note: We should see uninstalled release

# helm status command
    helm status mynginx

Note:
1. works only when we use --keep-history flag
2. We can see all the details of release with "Status: Uninstalled"
```

## Rollback Uninstalled Release
```t
# List Release History
    helm history mynginx

# Rollback Helm Uninstalled Release
    helm rollback <RELEASE> [REVISION] [flags]
    helm rollback mynginx 3

Note: It should rollback to specific revision number from revision history

# List Helm Releases
    helm list

# List Kubernetes Resources
    kubectl get pods
    kubectl get svc

# List Kubernetes Resources Deployed as part of this Helm Release
    helm status mynginx --show-resources

# Access Application 
    http://localhost:31232
```

## Best Practice for Helm Uninstall

>  **It is recommended to always use `--keep-history Flag` for following reasons**
   - Keeping Track of uninstalled releases
   - Quick Rollback if that Release is required