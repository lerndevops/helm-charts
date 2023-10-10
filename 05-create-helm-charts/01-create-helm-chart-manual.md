### `Note`: A helm chart follows pre defined directory structure with some pre defined file & directory names
   * **we can create all required directories & files `manually` as pre defined**  
    **`OR`**
   * **we can use `helm create` command to generate the directory & files accordingly**

## let's create a simple helm chart manually

#### create required directories & files 
```sh 
# Note in this example we will create the mandatory files & directories only

mkdir $HOME/mychart1    # this is main(root) chart directory, the name can by anything as per your project or application etc..
cd $HOME/mychart1
mkdir templates
touch Chart.yaml
```

#### write the chart metadata in Chart.yaml 
```sh
vi $HOME/mychart1/Chart.yaml
```
```yaml 
# place the below content inside the Chart.yaml

apiVersion: v2
type: application 
name: myappchart
version: "0.1.0"  # recomended to follow version as "MAJOR-Version.MINOR-Version.PATCH-Version" always 
description: "A Helm chart to deploy all required kubernetes resources for myapp"
appVersion: "1.0.0"  # your application version / release version 

# save the file with the above data
```

#### add/create the neccessary kubernetes resource yaml files under templates directory 
```sh 
cd $HOME/mychart1/templates
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
    #nodePort: 32105
# save the file with the above data
```

## install, uninstall, upgrade the chart 

#### install chart 
```sh
helm install mychart1-rel $HOME/mychart1/
```
```sh 
# validate 
helm list 
kubectl get pods,services,deployments -o wide 
```

#### upgrade chart 
```sh 
# ex: modify the replicas to 4 from 2 

vi $HOME/mychart1/templates/deployment.yaml
# change replicas value to 4
replicas: 4
```
```sh 
helm upgrade mychart1-rel $HOME/mychart1/
```
```sh
# validate 
helm list 
kubectl get pods,services,deployments -o wide 
```

#### uninstall chart 
```sh 
helm uninstall mychart1
```
```sh 
#validate 
helm list
kubectl get pods,services,deployments
```