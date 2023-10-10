## purpose of NOTES.txt  

* **can be created/found under `chartname/templates/NOTES.txt`** 
* **OPTIONAL file**
* **its a A plain text file containing short usage notes**
* **when we install a chart with `helm install`, if the chart consist of NOTES.txt it prints all the data in NOTES.txt to terminal after chart installed successufly** 
* **usefull to let know people understand the resources deployed, how to access the app deployed etc..**

#### create required directories & files 
```sh 
# Note in this example we will create the mandatory files & directories only

mkdir $HOME/noteschart    # this is main(root) chart directory, the name can by anything as per your project or application etc..
cd $HOME/noteschart
mkdir templates
touch Chart.yaml
```

#### write the chart metadata in Chart.yaml 
```sh
vi $HOME/noteschart/Chart.yaml
```
```yaml 
# place the below content inside the Chart.yaml
apiVersion: v2
type: application 
name: noteschart
version: "0.1.0"  # recomended to follow version as "MAJOR-Version.MINOR-Version.PATCH-Version" always 
description: "A Helm chart to deploy all required kubernetes resources for noteschart"
appVersion: "1.0.0"  # your application version / release version 
# save the file with the above data
```

#### add/create the neccessary kubernetes resource yaml files under templates directory 
```sh 
cd $HOME/noteschart/templates
```
```sh
vi deployment.yaml 
```
```yaml 
# place the below content in deployment.yaml 
apiVersion: apps/v1
kind: Deployment
metadata:
  name: java-app
  labels:
    app: sampleapp
spec:
  replicas: 2
  selector:
    matchLabels:
      app: sampleapp
  template:
    metadata:
      labels:
        app: sampleapp
    spec:
      containers:
      - name: sampleapp
        image: lerndevops/samples:java-app
        ports:
        - containerPort: 8080
# save the file with the above data
```

```sh
vi service.yaml 
```
```yaml 
# place the below content in service.yaml  
apiVersion: v1
kind: Service
metadata:
  name: java-app-service
spec:
  type: NodePort
  selector:
    app: sampleapp
  ports:
  - protocol: TCP
    port: 8080
    nodePort: 32105
# save the file with the above data
```
```sh
vi NOTES.txt
```
```sh
# place the below content in NOTES.txt
# the chart deployed the kubernetes resources as below
   * deployment named java-app with 2 replicas 
   * a nodeport service named java-app-service 
# inspect the resources using below commands 
   * kubectl get deployment -o wide 
   * kubectl get services -o wide 
# you may access the application using the nodeport allocated as below 
   * curl http://localhost:32105
```


## install the chart 

```sh
helm install noteschart-rel $HOME/noteschart/
```
```t
# observe the output as below 

NAME: noteschart-rel
LAST DEPLOYED: Tue Oct 10 16:49:01 2023
NAMESPACE: default
STATUS: deployed
REVISION: 1
TEST SUITE: None

NOTES:
# the chart deployed the kubernetes resources as below
   * deployment named java-app with 2 replicas
   * a nodeport service named java-app-service
# inspect the resources using below commands
   * kubectl get deployment -o wide
   * kubectl get services -o wide
# you may access the application using the nodeport allocated as below
   * curl http://localhost:32105
```

## uninstall the chart 
```sh
helm uninstall noteschart-rel
```