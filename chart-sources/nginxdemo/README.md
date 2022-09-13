## Add Repo Info to local 

```console
helm repo add <REPO-NAME> <REPO-URL>

helm repo add lerndevops https://lerndevops.github.io/helm-charts/
helm repo update

Note: REPO-NAME can be any value 
```

## search Charts available in a repo  
```console 

helm search repo <REPO-NAME>

ex: helm search repo lerndevops
```

## Install Chart

```console

$ helm install [RELEASE_NAME] lerndevops/nginxdemo

ex: helm install nginxdemo lerndevops/nginxdemo

Note: RELEASE_NAME can be any value 
```

## Upgrade Chart

```console

$ helm upgrade [RELEASE_NAME] lerndevops/nginxdemo

ex: helm upgrade nginxdemo lerndevops/nginxdemo
```

## Uninstall Chart

```console

$ helm uninstall [RELEASE_NAME]

ex: helm uninstall nginxdemo
```

## Download Chart to local 
```console

helm search repo lerndevops

helm pull lerndevops/nginxdemo --untar --untardir /tmp 
```

## to know different versions of perticular chart from repo 
```console
helm search repo lerndevops/nginxdemo --versions 
```

## install specific version of chart from repo 
```console
helm install nginxdemo-v1 lerndevops/nginxdemo --version 0.1
helm install nginxdemo-v2 lerndevops/nginxdemo --version 0.2
```  
