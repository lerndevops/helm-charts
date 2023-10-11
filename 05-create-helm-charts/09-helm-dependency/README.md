## Helm Subcharts - Dependency charts

## lets get the example chart from [GitHub Repo](../../chart-sources/springboot-app/) 
```sh
## clone the git repo 
cd $HOME ; git clone https://github.com/lerndevops/helm-charts.git

## change to chart directory 
cd $HOME/helm-charts/chart-sources/springboot-app
```

## inspect the Chart.yaml
```sh
cat $HOME/helm-charts/chart-sources/springboot-app/Chart.yaml 
```
```yaml
# output can be see as below 
apiVersion: v2
version: "1.0"
name: springbootapp
description: A Helm chart for Spring application
dependencies:
  - name: mongodb
    version: "1.0"
```
> #### Note: 
1. **the springbootapp chart has dependency of another chart called mongodb**
2. **the child chart must be present under the local charts directory, if not the springbootapp chart will fail to install** 

```sh 
# look for the content of the charts directory  
ls -l $HOME/helm-charts/chart-sources/springboot-app/charts 
```

## Helm Dependency Commands - List and Update
#### **helm dependency list:** List all of the dependencies declared in a chart.
```sh
## Helm Dependency List
helm dependency list

output: 
NAME   	VERSION	REPOSITORY	STATUS
mongodb	1.0    	          	unpacked
``` 
#### **helm dependency update:** update sprintboot-app chart `charts/` folded based on the contents of file `Chart.yaml`
```sh 
# Helm Dependency Update 
cd $HOME/helm-charts/chart-sources/springboot-app
helm dep update 
```
```sh
## obeserve the ouput as below 
Hang tight while we grab the latest from your chart repositories...
...Successfully got an update from the "lerndevops" chart repository
Update Complete. ⎈Happy Helming!⎈
Saving 1 charts
Dependency mongodb did not declare a repository. Assuming it exists in the charts directory
Deleting outdated charts
``` 
## Review Chart.lock file
* **The Chart.lock file lists the exact versions of immediate dependencies and their dependencies and so on.**

```sh
cat $HOME/helm-charts/chart-sources/springboot-app/Chart.lock
```

## use the dependency charts from remote repositories 
#### lets update the `Chart.yaml` as below 
```sh 
vi $HOME/helm-charts/chart-sources/springboot-app/Chart.yaml
```
```yaml 
apiVersion: v2
version: "1.0"
name: springbootapp
description: A Helm chart for Spring application
dependencies:
  - name: mongodb
    version: "1.0"
    repository: "https://lerndevops.github.io/helm-charts/"
  - name: mysql
    version: "9.9.0"
    repository: "https://charts.bitnami.com/bitnami"
# save the file with above content
```
#### lets also delete the local charts/ directory in springboot-app chart
```sh
cd $HOME/helm-charts/chart-sources/springboot-app
rm -rf charts/
```
#### now let run dependency list 
```sh 
cd $HOME/helm-charts/chart-sources/springboot-app
helm dep list 

## output 
NAME   	VERSION	REPOSITORY                               	STATUS
mongodb	1.0    	https://lerndevops.github.io/helm-charts/	missing
mysql  	9.9.0  	https://charts.bitnami.com/bitnami       	missing
```
#### run the dependency update to get missing charts 
```sh
cd $HOME/helm-charts/chart-sources/springboot-app
helm dep update 
```
```t
Hang tight while we grab the latest from your chart repositories...
...Successfully got an update from the "lerndevops" chart repository
...Successfully got an update from the "bitnami" chart repository
Update Complete. ⎈Happy Helming!⎈
Saving 2 charts
Downloading mongodb from repo https://lerndevops.github.io/helm-charts/
Downloading mysql from repo https://charts.bitnami.com/bitnami
Deleting outdated charts
```
#### Note:
   1. **we can observe that the missing dependency charts are now downloaded to local** 
   2. **and save to charts directory under springboot-app chart directory**  
```sh 
helm dep list 

# output 
NAME   	VERSION	REPOSITORY                               	STATUS
mongodb	1.0    	https://lerndevops.github.io/helm-charts/	ok
mysql  	9.9.0  	https://charts.bitnami.com/bitnami       	ok
```

## Helm Dependency Chart Version Ranges
### Helm Chart Version Notation
```sh
Helm Chart Version Notation: Major.Minor.Patch 
MySQL Helm Chart Version: 9.10.8
Major: 9
Minor: 10
Patch: 8
```
### Basic Comparison Operators
- **We can define the version constraints using basic comparison operators**
- **Where possible, use version ranges instead of pinning to an exact version.**
```sh
# Basic Comparison Operators
version: "= 9.10.8" 
version: "!= 9.10.8" 
version: ">= 9.10.8"
version: "<= 9.10.8"
version: "> 9.10.8"   
version: "< 9.10.8"
version: ">= 9.10.8 < 9.11.0"  
```

### For Range Comparison Major: Caret Symbol(ˆ)
- **`x` is a placeholder**
- **The caret (^) operator is for major level changes once a stable (1.0.0) release has occurred.**
```sh
# For Range Comparison Major: Caret Symbol(ˆ)
^9.10.1  is equivalent to >= 9.10.1, < 10.0.0
^9.10.x  is equivalent to >= 9.10.0, < 10.0.0   
^9.10    is equivalent to >= 9.10, < 10
^9.x     is equivalent to >= 9.0.0, < 10        
^0       is equivalent to >= 0.0.0, < 1.0.0
```

### For Range Comparison Minor: Tilde Symbol(~)
- **`x` is a placeholder**
- **The tilde (~) operator is for** 
  - **patch level ranges when a minor version is specified** 
  - **major level changes when the minor number is missing.**
- **The suggested default is to use a patch-level version match which is first one in the below table** 
```sh
# For Range Comparison Major: Caret Symbol(ˆ)
~9.10.1  is equivalent to >= 9.10.1, < 9.11.0 # Patch-level version match
~9.10    is equivalent to >= 9.10, < 9.11
~9       is equivalent to >= 9, < 10
^9.x     is equivalent to >= 9.0.0, < 10        
^0       is equivalent to >= 0.0.0, < 1.0.0
```
### Verify with some examples
- **Updates to parent chart `Chart.yaml`**
```yaml
dependencies:
- name: mysql
  version:" "9.10.9"
  #version: ">=9.10.1" # Should dowload latest version available as on that day
  #version: "<=9.10.6" # Should download 9.10.6 mysql helm chart package
  #version: "~9.9.0" # Should download latest from 9.9.x (Patch version) 
  #version: "~9.9" # Should download latest from 9.9 
  #version: "~9" # Should download latest from 9.x 
  repository: "https://charts.bitnami.com/bitnami"
```
```sh
# helm dependency update
helm dependency update
or
helm dep update  
```

## Helm Dependency Build Command
- **helm dependency build:** ***rebuild the `charts/` directory based on the `Chart.lock` file***
- **In short `dep update` command will negotiate with version constraints defined in `Chart.yaml` where as `dep build` will try to build or download or update whatever version preset in `Chart.lock` file**
- **If no lock file is found, `helm dependency build` will mirror the behavior of `helm dependency update`.**

```sh
# helm dependency build
cd $HOME/helm-charts/chart-sources/springboot-app
helm dependency build 
```

## Helm Dependency Repository @REPO vs REPO-URL
- **When we are using Helm with DevOps pipelines across environments "@REPO" approach is not recommended**
- **REPO-URL approach (repository: "https://charts.bitnami.com/bitnami") is always recommended**
```sh
cd $HOME/helm-charts/chart-sources/springboot-app
```
```sh
# With Repository URL (Recommended approach)
dependencies:
- name: mysql
  version: ">=9.10.8"
  repository: "https://charts.bitnami.com/bitnami"
```
```sh
# List Helm Repo
helm repo list
helm search repo bitnami/mysql --versions
```
```sh
# With @REPO (local repo reference - NOT RECOMMENDED)
dependencies:
- name: mysql
  version: ">=9.10.8"
  repository: "@bitnami"
```
```sh
# Clean-Up Charts folder and Chart.lock
rm charts/* ; rm Chart.lock
```
```sh
# Ensure we are using repository: "@bitnami"
helm dependency update
ls -l charts/
cat Chart.lock

Observation: Should work as expected
```