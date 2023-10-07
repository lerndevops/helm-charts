## Upgrade & Rollback a Helm Chart

## Search Helm Repo for nginxdemo

   -  **[Review nginxdemo chart in Github Repo](https://github.com/lerndevops/helm-charts/tree/main/packages)**
   -  **nginxdemo has 4 chart versions (0.1, 0.2, 0.3, 0.4)**
   -  **[we can also review on Artifacthub.io](https://artifacthub.io/packages/helm/sample-helm-charts/nginxdemo)**


```t
# Search Helm Repo

    helm repo add lerndevops https://lerndevops.github.io/helm-charts/
    helm search repo lerndevops/nginxdemo

    Note: Should display latest version of nginxdemo from lerndevops helm repo

# Search Helm Repo with --versions

    helm search repo nginxdemo --versions
    Note: Should display all versions of nginxdemo

# Search Helm Repo with --version

    helm search repo nginxdemo --version "CHART-VERSIONS"
    helm search repo nginxdemo --version "0.2"
    Note: Should display specified version of helm chart 
```

## Install specific version of Helm Chart

```t
# Install Helm Chart by specifying Chart Version
    helm install nginxdemo lerndevops/nginxdemo --version "CHART-VERSION"
    helm install nginxdemo lerndevops/nginxdemo --version "0.1"

# List Helm Release
    helm list 

# List Kubernetes Resources Deployed as part of this Helm Release
    helm status nginxdemo --show-resources
    kubectl get deployment -o wide 
    kubectl get services -o wide

# Access Application
    http://localhost:31232
```

## Helm Upgrade using Chart Version

```t
# Helm Upgrade using Chart Version
    helm upgrade nginxdemo lerndevops/nginxdemo --version "0.2"

# List Helm Release
    helm list 

# List Kubernetes Resources Deployed as part of this Helm Release
    helm status nginxdemo --show-resources
    kubectl get deployment -o wide

# Access Application
    http://localhost:31232

# List Release History
    helm history nginxdemo
```

## Helm Upgrade without Chart Version

```t
# Helm Upgrade using Chart Version
    helm upgrade nginxdemo lerndevops/nginxdemo

# List Helm Release
    helm list 

# List Kubernetes Resources Deployed as part of this Helm Release
    helm status nginxdemo --show-resources
    kubectl get deployment -o wide 

    Note: it deploys the latest release Chart Version 0.4 (Which is default or latest Chart version)

# Access Application
    http://localhost:31232
    

# List Release History
    helm history nginxdemo 
```

## Helm Rollback

- **Roll back a release to a previous revision or a specific revision**

```t
# Rollback to previous version
    helm rollback RELEASE-NAME 
    helm rollback nginxdemo

# List Helm Release
    helm list 

# List Kubernetes Resources Deployed as part of this Helm Release
    helm status nginxdemo --show-resources
    kubectl get deployment -o wide  

    Note: we Should see V2 version of Application (Chart Version 0.2)

# Access Application
    http://localhost:31232

# List Release History
    helm history nginxdemo
```

## Helm Rollback to specific Revision

- **Roll back a release to a previous revision or a specific revision**

```t
# Rollback to previous version
    helm rollback RELEASE-NAME REVISION
    helm rollback nginxdemo 1

# List Helm Release
    helm list 

# List Kubernetes Resources Deployed as part of this Helm Release
    helm status nginxdemo --show-resources
    kubectl get deployment -o wide

    Note: we Should see V1 version of Application (Chart Version 0.1)

# Access Application
    http://localhost:31232


# List Release History
    helm history nginxdemo
```

## Summary 
#### what we learned 
- additional flags for `helm search repo` command
- Install and Upgrade Helm Releases using Chart Versions
- few commands as below 
   - helm install
   - helm search repo
   - helm status
   - helm upgrade
   - helm rollback
   - helm history