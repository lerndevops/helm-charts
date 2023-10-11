# ntchart4 Helm Chart

## Installing the Chart
- To install the chart with the release name `myapp` run:
```t
# Add Helm Repository
$ helm repo list
helm repo add lerndevops https://lerndevops.github.io/helm-charts/
$ helm repo list
$ helm repo update 

# Install Helm Chart
$ helm install myapp lerndevops/ntchart4
```

## Verify if Helm Installed successfully
```t
# Helm Status myapp 
$ helm status myapp --show-resources
or
# using kubectl commands
kubectl get pods
kubectl get svc

# Access Application
http://localhost:<Get-from-svc-output>
```

## Uninstall the Chart
```t
# Uninstall Helm Chart
$ helm uninstall myapp
```
