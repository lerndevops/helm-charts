## What is a Helm chart repository?

> **At a high level, a chart repository is a location where packaged charts can be stored and shared.**

> **The distributed community Helm chart repository is located at `Artifact Hub` and welcomes participation. But Helm also makes it possible to create and run your own chart repository.**

- [The Chart Repository Guide](https://helm.sh/docs/topics/chart_repository/)

## Public Helm repositories

### Add, List and Search Helm Repositories

- [Search for Helm Charts at Artifacthub.io](https://artifacthub.io/)
- [Bitnami Applications packaged using Helm](https://bitnami.com/stacks/helm)
- [prometheous Helm Chart](https://artifacthub.io/packages/helm/prometheus-community/prometheus)
- [nginxdemo Helm Chart](https://artifacthub.io/packages/helm/sample-helm-charts/nginxdemo)

```t
# List Helm Repositories
    helm repo list

# Add Helm Repository
    helm repo add <DESIRED-NAME> <HELM-REPO-URL>
    helm repo add mybitnami https://charts.bitnami.com/bitnami
    helm repo add lerndevops https://lerndevops.github.io/helm-charts/

# List Helm Repositories in local
    helm repo list

# Search a Helm Chart from added Repositories 
    helm search repo <KEY-WORD>
    helm search repo nginx
    helm search repo apache

# search all Helm Charts from a repository
    helm search repo <repo name used while adding>
    helm search repo lerndevops

# search a Helm Chart from a reqpository 
    helm search repo <repo name used while adding>/<chart name>
    helm search repo lerndevops/nginxdemo
```

## know about the remote chart 

### helm show 
```t 
helm repo add lerndevops https://lerndevops.github.io/helm-charts/

helm show all lerndevops/nginxdemo
```

### helm template
```t
helm repo add lerndevops https://lerndevops.github.io/helm-charts/

helm template lerndevops/nginxdemo
```

## download a chart to local 

### helm pull 

```sh 
helm repo add lerndevops https://lerndevops.github.io/helm-charts/
```
```sh
cd $HOME

#download a tar bundle of specified chart 
helm pull lerndevops/sampleapp

devops@kube-master:~$ ls -l $HOME
-rw-r--r-- 1 devops devops 864 Oct  9 17:18 sampleapp-0.3.tgz
```

```sh
# downlaod & untar a specified chart to current directory 
helm pull lerndevops/sampleapp --untar

devops@kube-master:~$ ls -l $HOME
drwxr-xr-x  3 devops devops  4096 Oct  9 17:19 sampleapp
```

```sh
# downalod & untar a specified chart to a specific directory 
helm pull lerndevops/sampleapp --untar --untardir /tmp

devops@kube-master:~$ ls -l /tmp
drwxr-xr-x  3 devops devops 4096 Oct  9 17:25 sampleapp
```
