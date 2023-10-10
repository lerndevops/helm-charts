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

#### examin the ntchart1 from [github repo](https://github.com/lerndevops/helm-charts/tree/main/05-create-helm-charts/06-named-templates/ntchart1) 

```sh
# get the chart to local 
cd $HOME ; git clone https://github.com/lerndevops/helm-charts
cd $HOME/helm-charts/05-create-helm-charts/07-flow-control/iechart1
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
