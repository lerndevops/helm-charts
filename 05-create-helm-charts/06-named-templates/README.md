## named templates
* helps to define templates & re use across the chart resource template yaml files 

## define a named template & reuse 

#### examin the ntchart1 from [github repo](https://github.com/lerndevops/helm-charts/tree/main/05-create-helm-charts/06-named-templates/ntchart1) 

```sh
# get the chart to local 
cd $HOME ; git clone https://github.com/lerndevops/helm-charts
cd $HOME/helm-charts/05-create-helm-charts/06-named-templates/ntchart1
cat templates/deployment.yaml
```
```yaml 
{{/* define template for common Labels */}}
{{- define "nt.labels"}}
    app: sapp
{{- end }}

apiVersion: apps/v1
kind: Deployment
metadata:
  name: {{ .Release.Name }}-app
  labels:
  {{- template "nt.labels" }}
```
```sh
# dry run the chart and observe the output rendered properly 

cd $HOME/helm-charts/05-create-helm-charts/06-named-templates/ntchart1
helm install ntchart1-rel . --dry-run 
```

## use builtin objects in template definitions 

#### examin the ntchart2 from [github repo](https://github.com/lerndevops/helm-charts/tree/main/05-create-helm-charts/06-named-templates/ntchart2)

```sh
# get the chart to local 
cd $HOME ; git clone https://github.com/lerndevops/helm-charts
cd $HOME/helm-charts/05-create-helm-charts/06-named-templates/ntchart2
cat templates/deployment.yaml
```
```yaml 
{{/* Common Labels */}}
{{- define "nt.labels"}}
    app: sapp
    cname: {{ .Chart.Name }}
{{- end }}

apiVersion: apps/v1
kind: Deployment
metadata:
  name: {{ .Release.Name }}-app
  labels:
  {{- template "nt.labels" . }}
```
```sh
# dry run the chart and observe the output rendered properly 

cd $HOME/helm-charts/05-create-helm-charts/06-named-templates/ntchart2
helm install ntchart2-rel . --dry-run 
```

## underscore file (_helpers.tpl)
* **Move the named template nt.labels to _helpers.tpl file inside chatname/templates directory**
* **files whose name begins with an underscore (_) are assumed to not have a kubernetes manifest inside.**
* **These files are not rendered to Kubernetes object definitions, but are available everywhere within other chart templates for use.**
* **These files are used to store partials and helpers.**

#### examin the ntchart3 from [github repo](https://github.com/lerndevops/helm-charts/tree/main/05-create-helm-charts/06-named-templates/ntchart3)

```sh
# get the chart to local 
cd $HOME ; git clone https://github.com/lerndevops/helm-charts
cd $HOME/helm-charts/05-create-helm-charts/06-named-templates/ntchart3
cat templates/_helpers.tpl 
```
```sh 
{{/* Common Labels */}}
{{- define "nt.labels"}}
    app: sapp
    cname: {{ .Chart.Name }}
{{- end }}
```
```sh
# dry run the chart and observe the output rendered properly 

cd $HOME/helm-charts/05-create-helm-charts/06-named-templates/ntchart3
helm install ntchart3-rel . --dry-run 
```