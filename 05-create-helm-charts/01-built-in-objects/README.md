## Helm Templates: Builtin Objects

- **Objects are passed into a template from the template engine.** 
- **Objects can be simple, and have just one value or they can contain other objects or functions.**
- **For example: the Release object contains several objects (like .Release.Name) and the Files object has a few functions.**

### Helm Builtin Objects

- **Release** 
- **Chart** 
- **Values** 
- **Capabilities** 
- **Template** 
- **Files** 

## Create a simple chart and clean-up NOTES.txt
```t
# Create Helm Chart

  helm create $HOME/antiks

# Remove all content from NOTES.txt
cd $HOME/antiks/templates
>NOTES.txt

cd $HOME

# helm install --dry-run
helm install antiks antiks/ --dry-run
```

## Root or dot or Period (.) Object 
```sh
# Update NOTES.txt
{{/* Root or Dot or Period Object */}}
Root Object: {{ . }}
```
```sh
cd $HOME
# helm install with --dry-run
helm install antiks antiks/ --dry-run
```
```sh
#sample output 
NOTES:
Root Object: map[Capabilities:0xc00097c120 Chart:{{app1  [] 0.1 A Helm Chart for app1 [] []  v2   1.0 false map[]  [] } true} Files:map[] Release:map[IsInstall:true IsUpgrade:false Name:app1 Namespace:default Revision:1 Service:Helm] Subcharts:map[] Template:map[BasePath:app1/templates Name:app1/templates/NOTES.txt] Values:map[]]
```

## Release Object
- This object describes the Helm release. 
- It has several objects inside it related to Helm Release.
- Put the below in `NOTES.txt` and test it
```t

vi $HOME/antiks/templates/NOTES.txt

{{/* Release Object */}}
Release Name: {{ .Release.Name }}
Release Namespace: {{ .Release.Namespace }}
Release IsUpgrade: {{ .Release.IsUpgrade }}
Release IsInstall: {{ .Release.IsInstall }}
Release Revision: {{ .Release.Revision }}
Release Service: {{ .Release.Service }}
```
```sh
# Helm Install with --dry-run
helm install antiks antiks/ --dry-run
```
```t
# Sample Output
NOTES:
Release Name: myapp101
Release Namespace: default
Release IsUpgrade: false
Release IsInstall: true
Release Revision: 1
Release Service: Helm
```

## Chart Object
- Any data in Chart.yaml will be accessible using Chart Object. 
- For example {{ .Chart.Name }}-{{ .Chart.Version }} will print out the antiks-0.1.0.
- [Complte Chart.yaml Objects for reference](https://helm.sh/docs/topics/charts/#the-chartyaml-file)

```sh

vi $HOME/antiks/templates/NOTES.txt

{{/* Chart Objet */}}
Chart Name: {{ .Chart.Name }}
Chart Version: {{ .Chart.Version }}
Chart AppVersion: {{ .Chart.AppVersion }}
Chart Type: {{ .Chart.Type }}
Chart Name and Version: {{ .Chart.Name }}-{{ .Chart.Version }}
```
```sh
cd $HOME
# Helm Install with --dry-run
helm install antiks antiks/ --dry-run
```
```sh
# Sample Output
Chart Name: antiks
Chart Version: 0.1.0
Chart AppVersion: 0.1.0
Chart Type: application
Chart Name and Version: antiks-0.1.0
```

## Values Object
- **Values Object:** Values passed into the template from the values.yaml file and from user-supplied files. By default, Values is empty.
- Put the below in `NOTES.txt` and test it
```sh
vi $HOME/antiks/values.yaml 
replicaCount: 2
image
  repository: docker.io/lerndevops/samples
  tag: pyapp-v1
service
  type: LoadBalancer
```
```sh
vi $HOME/antiks/templates/NOTES.txt

{{/* Values Object */}}
Replica Count: {{ .Values.replicaCount }}
Image Repository: {{ .Values.image.repository }}
Service Type: {{ .Values.service.type }}
```
```sh
# Helm Install with --dry-run
cd $HOME
helm install antiks antiks/ --dry-run
```
```sh
# Sample Output
Replica Count: 2
Image Repository: docker.io/lerndevops/samples
Service Type: LoadBalancer
```

## Capabilities Object 
- **Capabilities Object:** This provides information about what capabilities the Kubernetes cluster supports
```sh

vi $HOME/antiks/templates/NOTES.txt

{{/* Capabilities Object */}}
Kubernetes Cluster Version Major: {{ .Capabilities.KubeVersion.Major }}
Kubernetes Cluster Version Minor: {{ .Capabilities.KubeVersion.Minor }}
Kubernetes Cluster Version: {{ .Capabilities.KubeVersion }} and {{ .Capabilities.KubeVersion.Version }}
Helm Version: {{ .Capabilities.HelmVersion }}
Helm Version Semver: {{ .Capabilities.HelmVersion.Version }}
```
```sh
# Helm Install with --dry-run
cd $HOME
helm install antiks antiks/ --dry-run
```
```sh 
# Sample Output
Kubernetes Cluster Version Major: 1
Kubernetes Cluster Version Minor: 27
Kubernetes Cluster Version: v1.27.2 and v1.27.2
Helm Version: {v3.12.1 f32a527a060157990e2aa86bf45010dfb3cc8b8d clean go1.20.5}
Helm Version Semver: v3.12.1
```
## Template Object
- **Template Object:** Contains information about the current template that is being executed
```sh

vi $HOME/antiks/templates/NOTES.txt

{{/* Template Object */}}
Template Name: {{ .Template.Name }} 
Template Base Path: {{ .Template.BasePath }}
```
```sh
# Helm Install with --dry-run
cd $HOME
helm install antiks antiks/ --dry-run
```
```sh
# Sample Output
Template Name: antiks/templates/NOTES.txt 
Template Base Path: antiks/templates
```

## Files Object 

- **Files Object:** 
- Put the below in `NOTES.txt` and test it
- [Additional Reference: Access Files Inside Templates](https://helm.sh/docs/chart_template_guide/accessing_files/)

```sh
# Create files 
vi $HOME/antiks/app1.conf
naresh: naresh 
learning: helmcharts
# save the file after adding the data 

mkdir $HOME/antiks/conf
vi $HOME/antiks/conf/app.props
appName: antiks
type: webapp
stateless: true 
# save the file after adding the data 
```

```sh
vi $HOME/antiks/templates/NOTES.txt

{{/* File Object */}}
File Get: {{ .Files.Get "app1.conf" }}
File Glob as Config: {{ (.Files.Glob "conf/*").AsConfig }}
File Glob as Secret: {{ (.Files.Glob "conf/*").AsSecrets }}
File Lines: {{ .Files.Lines "app1.conf" }}
File Lines: {{ .Files.Lines "conf/app.props" }}
File Glob: {{ .Files.Glob "conf/*" }}
```
```sh
cd $HOME 
# Helm Install with --dry-run
helm install antiks antiks/ --dry-run
``` 
```sh
# Sample Output
NOTES:
File Get: 
naresh: naresh
learning: helmcharts
# save the file after adding the data

File Glob as Config: app.props: "appName: antiks\ntype: webapp\nstateless: true \n# save the file after adding the data \n"
File Glob as Secret: app.props: YXBwTmFtZTogYW50aWtzCnR5cGU6IHdlYmFwcApzdGF0ZWxlc3M6IHRydWUgCiMgc2F2ZSB0aGUgZmlsZSBhZnRlciBhZGRpbmcgdGhlIGRhdGEgCg==
File Lines: [naresh: naresh  learning: helmcharts # save the file after adding the data]
File Lines: [appName: antiks type: webapp stateless: true  # save the file after adding the data ]
File Glob: map[conf/app.props:[97 112 112 78 97 109 101 58 32 97 110 116 105 107 115 10 116 121 112 101 58 32 119 101 98 97 112 112 10 115 116 97 116 101 108 101 115 115 58 32 116 114 117 101 32 10 35 32 115 97 118 101 32 116 104 101 32 102 105 108 101 32 97 102 116 101 114 32 97 100 100 105 110 103 32 116 104 101 32 100 97 116 97 32 10]]
```

## Additional Reference
- [Helm Built-In Objects](https://helm.sh/docs/chart_template_guide/builtin_objects/)
- [Helm Chart.yaml Fields](https://helm.sh/docs/chart_template_guide/builtin_objects/)

