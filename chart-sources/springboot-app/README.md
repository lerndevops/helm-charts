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

$ helm install [RELEASE_NAME] lerndevops/springbootapp

ex: helm install springbootapp lerndevops/springbootapp

Note: RELEASE_NAME can be any value 
```

## Uninstall Chart

```console

$ helm uninstall [RELEASE_NAME]

ex: helm uninstall springbootapp
```

## Upgrade Chart

```console

$ helm upgrade [RELEASE_NAME] lerndevops/springbootapp

ex: helm upgrade springbootapp lerndevops/springbootapp
```

## Download Chart to local 
```console

helm search repo lerndevops

helm pull lerndevops/springbootapp --untar --untardir /tmp 
```

## to know different versions of perticular chart from repo 
```console
helm search repo lerndevops/springbootapp --versions 
```

## install specific version of chart from repo 
```console
helm install springboot-v1 lerndevops/springbootapp --version 0.1
helm install springboot-v2 lerndevops/springbootapp --version 0.2
```  