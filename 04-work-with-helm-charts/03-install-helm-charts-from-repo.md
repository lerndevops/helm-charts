## Install a Helm Chart

```t
# Update Helm Repo

# Make sure we get the latest list of charts from all repositories added to local
    helm repo update   

# get the latest list of chart from mentioned repository only
    helm repo update <reponame used while adding>
    helm repo update lerndevops  

# Install Helm Chart
    helm repo list 
    helm search repo lerndevops
    helm install <RELEASE-NAME> <repo_name_in_your_local_desktop/chart_name>
    helm install sampleapp lerndevops/sampleapp
```

## List Helm Releases
> **This command lists all of the releases for a specified namespace**
```t
# List Helm Releases (Default Table Output)
    helm list 
    helm ls

# List Helm Releases (YAML Output)
    helm list --output=yaml

# List Helm Releases (JSON Output)
    helm list --output=json

# List Helm Releases with namespace flag
    helm list --namespace=default
    helm list -n default
```

## List Kubernetes Resources

```t
# List Kubernetes Pods
    kubectl get deployments
    kubectl get pods

# List Kubernetes Services
    kubectl get svc
    Observation: Review the ports field and find the NodePort genereated. 

# Access Nginx Application on local desktop browser

    Access the nginx page from local desktop using your vmip(nodeip):nodeport

    http://vmip:nodeport
    http://10.128.0.2:31234

# Access Application using curl command

    curl http://10.128.0.2:31234

```
## Step-06: Uninstall Helm Release - NO FLAGS
```t
# List Helm Releases
    helm ls

# Uninstall Helm Release
    helm uninstall <RELEASE-NAME>
    helm uninstall mynginx 
```