## if-else Syntax
```t
{{ if PIPELINE }}
    # Do something
{{ else if OTHER PIPELINE }}
    # Do something else
{{ else }}
    # Default case
{{ end }}
```
## logic flow control functions
* [Logic and Flow Control Functions](https://helm.sh/docs/chart_template_guide/function_list/#logic-and-flow-control-functions)
* Helm includes numerous logic and control flow functions including and, coalesce, default, empty, eq, fail, ge, gt, le, lt, ne, not, and or.
---
## if-else eq
#### examin the iechart1 from [github repo](iechart1/) 

```sh
# get the chart to local 
cd $HOME ; git clone https://github.com/lerndevops/helm-charts
cd $HOME/helm-charts/05-create-helm-charts/07-flow-control/iechart1
```
```sh
cat values.yaml  # observe the values 
cat templates/deployment.yaml  # observe if else condition used for replicas 
```
```sh
# dry run the chart and observe the output rendered properly 

cd $HOME/helm-charts/05-create-helm-charts/07-flow-control/iechart1
helm install iec1-rel . --dry-run 
```
```yaml
# output as below 

NAME: iec1-rel
LAST DEPLOYED: Tue Oct 10 20:14:17 2023
NAMESPACE: default
STATUS: pending-install
REVISION: 1
TEST SUITE: None
HOOKS:
MANIFEST:
---
# Source: iec1/templates/deployment.yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: iec1-rel-app
spec:
  replicas: 2
  selector:
    matchLabels:
      app: iec
  template:
    metadata:
      labels:
        app: iec
    spec:
      containers:
      - name: sampleapp
        image: docker.io/lerndevops/samples:pyapp-v2
        ports:
        - containerPort: 8080
```
---