## define variables

#### examin the varchart1 from [github repo](https://github.com/lerndevops/helm-charts/tree/main/05-create-helm-charts/08-helm-chart-variables/varchart1) 

```sh
# get the chart to local 
cd $HOME ; git clone https://github.com/lerndevops/helm-charts
cd $HOME/helm-charts/05-create-helm-charts/08-helm-chart-variables/varchart1
cat templates/deployment.yaml
```
```yaml 
{{/* variable definition */}}
{{- $chartname := .Chart.Name | quote | upper -}}
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
spec:
  replicas: 2
  selector:
    matchLabels:
    {{- include "nt.labels" . | indent 2 }}
  template:
    metadata:
      {{- with . }}
      annotations:
        cname/helm.sh: {{ $chartname }}
      {{- end }}
      labels:
      {{- include "nt.labels" . | indent 4 }}
    spec:
      containers:
      - name: sampleapp
        image: lerndevops/samples:java-app
        ports:
        - containerPort: 8080
```
```sh
# dry run the chart and observe the output rendered properly 

cd $HOME/helm-charts/05-create-helm-charts/08-helm-chart-variables/varchart1
helm install vch1-rel . --dry-run 
```