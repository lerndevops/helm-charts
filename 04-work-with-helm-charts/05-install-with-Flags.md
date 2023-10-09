## Helm Install with `--dry-run`

- **dry-run does not install the chart**
- **populates the yaml defenitions on command line**

```t
# Helm install --dry-run
    helm install test lerndevops/sampleapp --dry-run
Note: observe the yaml printed on CLI

# List Helm Release 
    helm list 
Note: no release will be found with name test
```

## Helm Install with `--debug`

- **--debug shows the details information during the install process, also shows any error for failures on command line**
- **populates the yaml defenitions on command line**

```t
# Helm install --dry-run
    helm install test lerndevops/nginxdemo --dry-run
Note: observe the yaml printed on CLI, with few additional information 

# List Helm Release 
    helm list 
Note: a release will be found with name test
```

## Helm Install with `--generate-name Flag`

- **`--generate-name` flag for `helm install` is very useful option**
- **When we are implementing DevOps Pipelines, if we want to generate the names of our releases without throwing duplicate release errors we can use this setting.**

## Install helm with --generate-name flag
```t
# Install helm with --generate-name flag
    helm install <repo_name_in_your_local_desktop/chart_name> --generate-name
    helm install lerndevops/mongodb --generate-name

# List Helm Releases
    helm list
    helm list --output=yaml

Observation:
    We can see the name as "name: mongodb-1696675051" some auto-generated number

# Helm Status
    helm status mongodb-1696675051
    helm status mongodb-1696675051 --show-resources

# Uninstall Helm Release
    helm uninstall <RELEASE-NAME>
    helm uninstall mongodb-1696675051
```

## Helm Install with `--atomic` Flag

> ### Install Helm Chart - with Release Name: test007

```t
# Install Helm Chart 
    helm install test007 lerndevops/sampleapp

# List Helm Release
    helm list 

# List Kubernetes Resources Deployed as part of this Helm Release
    helm status test007 --show-resources
```

> ### Install Helm Chart - Release: test008
```t
# Install Helm Chart 
    helm install test008 lerndevops/sampleapp

expected to see below error 

Error: INSTALLATION FAILED: 1 error occurred:
	* Service "test008-sampleapp" is invalid: spec.ports[0].nodePort: Invalid value: 32105: provided port is already allocated

# List Helm Relase 
    helm list 

NAME   	NAMESPACE	REVISION	UPDATED                                	STATUS  	CHART        	APP VERSION
test007	default  	1       	2023-10-07 11:14:31.734466406 +0000 UTC	deployed	sampleapp-0.3	3.0
test008	default  	1       	2023-10-07 11:15:00.478183887 +0000 UTC	failed  	sampleapp-0.3	3.0

Find the test008 release failed status 

# uninstall test008 release 
    helm uninstall test008
```

> ### Install Helm Chart - Release: test008 with `--atomic flag`

- when `--atomic` flagis set, the installation process deletes the installation on failure. 
- The `--wait` flag will be set automatically if `--atomic` is used
- `--wait` will wait until all Pods, PVCs, Services, and minimum number of Pods of a Deployment, StatefulSet, or ReplicaSet are in a ready state before marking the release as successful. It will wait for as long as `--timeout`
- `--timeout`  time to wait for any individual Kubernetes operation (like Jobs for hooks) (default 5m0s)

```t
# Install Helm Chart 
    helm install test008 lerndevops/sampleapp --atomic

Error: INSTALLATION FAILED: release test008 failed, and has been uninstalled due to atomic being set: 1 error occurred:
	* Service "test008-sampleapp" is invalid: spec.ports[0].nodePort: Invalid value: 32105: provided port is already allocated

# List Helm Release 
    helm list # Note: We will not see test008 FAILED release, --atomic flag deleted the release as soon as it is failed with error
```

> ### Uninstall test007 Release
```t
# Uninstall test007 release
    helm uninstall test007

# List Helm Releases
    helm list
```

## Helm install with `--create-namespace` Flag

Note:
   - **Any resource we manage using HELM are specific to Kubernetes Namespace**
   - **By default, Kubernetes resources deployed to k8s cluster using default namespace, so we don't need to specify namespace name explicitly**
   - **In the case if we want to deploy k8s resources to a namespace (other than default), then we need to specify that in `helm install` command with flag `--namespace` or `-n`**
   - **In addition, we can also create a namespace during `helm install` using flags `--namespace`  `--create-namespace`**

> ###  Install Helm Release by creating Kubernetes Namespace dev
```t
# List Kubernetes Namespaces 
    kubectl get ns

# Install Helm Release by creating Kubernetes Namespace
    helm install nginxtest lerndevops/nginxdemo --version "0.1" --namespace dev --create-namespace 

# List Kubernetes Namespaces 
    kubectl get ns
    Note: Found the dev namespace created as part of `helm install`

# List Helm Release
    helm list --> NO RELEASES in default namespace
    helm list --namespace dev

# List Kubernetes resources 
    kubectl get pods -n dev
    kubectl get svc -n dev
    kubectl get deploy -n dev

# Helm Upgrade
    helm upgrade nginxtest lerndevops/nginxdemo --version "0.2" --namespace dev 

# Uninstall Helm Releas
    helm uninstall nginxtest --namespace dev

# List Helm Release
    helm list -n dev
```

#### Note: 
1. **When uninstalling helm release, it will not delete the Kubernetes Resource: dev namespace.**
2. **If we dont need that dev namespace we need to manually delete it from kubernetes using kubectl**

```t
# Delete dev namespace
    kubectl delete ns dev

# List Kubernetes Namespaces
    kubectl get ns
```
