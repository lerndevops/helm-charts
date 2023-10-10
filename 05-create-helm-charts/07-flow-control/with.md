#### with action controls variable scoping.
#### with action can allow you to set the current scope (.) to a particular object.

## with Syntax
```t
{{ with PIPELINE }}
  # restricted scope
{{ end }}
```
---
## with action 
* with action statement sets the dot obejct "." to .Values.wapplabels
* Inside the with action block dot "." always refers to .Values.wapplabels
* Outside the with action block dot "." refers to Root Object

#### examin the iechart1 from [github repo](wchart1/) 

```sh
# get the chart to local 
cd $HOME ; git clone https://github.com/lerndevops/helm-charts
cd $HOME/helm-charts/05-create-helm-charts/07-flow-control/wchart1
```
```sh
cat values.yaml  # observe the values 
cat templates/deployment.yaml  # observe if else condition used for replicas 
```
```sh
# dry run the chart and observe the output rendered properly 

cd $HOME/helm-charts/05-create-helm-charts/07-flow-control/wchart1
helm install wc1 . --dry-run 
```
```yaml
# output as below 

NAME: wc1
LAST DEPLOYED: Tue Oct 10 21:13:12 2023
NAMESPACE: default
STATUS: pending-install
REVISION: 1
TEST SUITE: None
HOOKS:
MANIFEST:
---
# Source: templates/deployment.yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: wc2-app
  labels:
    app: nginx
spec:
  replicas: 2
  selector:
    matchLabels:
      app: wapp
      proj: "007"
      type: web
  template:
    metadata:
      labels:
        app: wapp
        proj: "007"
        type: web
    spec:
      containers:
      - name: nginx
        image: docker.io/lerndevops/samples:pyapp-v2
        ports:
        - containerPort: 3000
```
---
## Scope more detailed for "with" action block

#### examin the wchart2 from [github repo](wchart2/) 

```sh
# get the chart to local 
cd $HOME ; git clone https://github.com/lerndevops/helm-charts
cd $HOME/helm-charts/05-create-helm-charts/07-flow-control/wchart2
```
```sh
cat values.yaml  # observe the values 
cat templates/deployment.yaml  # observe if else condition used for replicas 
```
```sh
# dry run the chart and observe the output rendered properly 

cd $HOME/helm-charts/05-create-helm-charts/07-flow-control/wchart2
helm install wc2 . --dry-run 
```
