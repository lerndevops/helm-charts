## range flow control 
* range, which provides a "for each"-style loop

## range with action List/Array

#### examin the iechart1 from [github repo](rchart1/) 

```sh
# get the chart to local 
cd $HOME ; git clone https://github.com/lerndevops/helm-charts
cd $HOME/helm-charts/05-create-helm-charts/07-flow-control/rchart1
```
```sh
cat values.yaml  # observe the values 
cat templates/ns.yaml  # observe if else condition used for replicas 
```
```sh
# dry run the chart and observe the output rendered properly 

cd $HOME/helm-charts/05-create-helm-charts/07-flow-control/rchart1
helm install rc1 . --dry-run 
```
---
## range action with variable

#### examin the rchart2 from [github repo](rchart2/) 

```sh
# get the chart to local 
cd $HOME ; git clone https://github.com/lerndevops/helm-charts
cd $HOME/helm-charts/05-create-helm-charts/07-flow-control/rchart2
```
```sh
cat values.yaml  # observe the values 
cat templates/ns.yaml  # observe if else condition used for replicas 
```
```sh
# dry run the chart and observe the output rendered properly 

cd $HOME/helm-charts/05-create-helm-charts/07-flow-control/rchart2
helm install rc2 . --dry-run 
```
### range with dict/map
#### examin the rchart3 from [github repo](rchart3/)

```sh
# get the chart to local
cd $HOME ; git clone https://github.com/lerndevops/helm-charts
cd $HOME/helm-charts/05-create-helm-charts/07-flow-control/rchart3
```
```sh
cat values.yaml  # observe the values
cat templates/cm.yaml  # observe if else condition used for replicas
cat templates/cm-with-vars.yaml
```
```sh
# dry run the chart and observe the output rendered properly

cd $HOME/helm-charts/05-create-helm-charts/07-flow-control/rchart3
helm install rc3 . --dry-run
```
