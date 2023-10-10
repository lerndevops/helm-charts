## Helm's chart templates

> **Templates generate manifest files, which are YAML-formatted resource descriptions that Kubernetes can understand. We'll look at**

* **how templates are structured,** 
* **how they can be used,**
* **how to write Go templates,**
* **and how to debug your work.**



## Helm Template Actions, Functions and Pipelines

### [HELM TEMPLATE ACTIONS & FUNCTIONS GUIDE](https://helm.sh/docs/chart_template_guide/)

### A Few template functions as below we can understand 

1. Template Actions `{{ }}`
2. Action Elements `{{ .Release.Name }}`
3. Quote Function
4. Pipeline 
5. default Function
6. lower function
7. Controlling White Spaces `{{-  -}}`
7. indent function
8. nindent function
9. toYaml

## Template Action "{{ }}"
- Anything in between Template Action `{{ .Chart.Name }}` is called Action Element
- Anything in between Template Action `{{ .Chart.Name }}` will be rendered by helm template engine and replace necessary values
- Anything outside of the template action will be printed as it is.
- Action elements defined inside the `{{ }}` will help us to retrieve data from other sources (example: `.Chart.Name`).
### Valid Action Element
```yaml
helm repo add lerndevops https://lerndevops.github.io/helm-charts/
cd $HOME
helm pull lerndevops/app1 --untar
cat $HOME/app1/templates/deployment.yaml 

apiVersion: apps/v1
kind: Deployment
metadata:
  # Template Action with Action Elements
  name: {{ .Release.Name }}-{{ .Chart.Name }}

# helm template
helm template test app1/
```

### Invalid Action Element 
```yaml
# vi $HOME/app1/templates/deployment.yaml

apiVersion: apps/v1
kind: Deployment
metadata:
  # Template Action with Action Elements
  name: {{ something }}-{{ .Chart.Name }}

# Helm Template Command
helm template test app1/

Observation:
1. Should fail with error
2. In short, inside Action Element we should have 

Error: parse error at (helmbasics/templates/deployment.yaml:10): function "something" not defined
```

## Template Function: quote
```yaml

vi $HOME/app1/templates/deployment.yaml ## add the below under metadata section of yaml 

# Add Quote Function 
  annotations:    
    app.kubernetes.io/managed-by: {{ .Release.Service }}
    # quote function
    app.kubernetes.io/managed-by: {{ quote .Release.Service }} 

cd $HOME

# Helm Template Command
helm template test app1/
```

## Pipeline
- Pipelines are an efficient way of getting several things done in sequence. 
- Inverting the order is a common practice in templates (.val | quote ) 

```yaml

vi $HOME/app1/templates/deployment.yaml ## add the below under metadata section of yaml 
# Add Quote Function with Pipeline
  annotations:    
    # quote function with pipeline
    app.kubernetes.io/managed-by: {{ .Release.Service | quote }}               

cd $HOME

# Helm Template Command
helm template test app1/ 
```

## Template Function: default, lower and upper  
- [default function](https://helm.sh/docs/chart_template_guide/function_list/#default)

```yaml
vi $HOME/app1/values.yaml
# values.yaml
releaseName: "testrelease101"
replicaCount: 3

vi $HOME/app1/templates/deployment.yaml ## add the below under metadata & spec section of yaml 

# Template Function default
  annotations:    
    # default Function
    app.kubernetes.io/name: {{ default "TESTRELEASE101" .Values.releaseName }}
spec:
  replicas: {{ default 1  .Values.replicaCount }}

cd $HOME

# Helm Template Command
helm template test app1/
```

## Controlling Whitespaces
- **{{- .Chart.name }}:**  If a hyphen is added before the statement, `{{- .Chart.name }}` then the leading whitespace will be ignored during the rendering
- **{{ .Chart.name -}}:** If a hyphen is added after the statement, `{{ .Chart.name -}}` then the trailing whitespace will be ignored during the rendering
```yaml

vi $HOME/app1/templates/deployment.yaml ## add the below under metadata section of yaml 

  annotations:
    # Controlling Leading and Trailing White spaces 
    leading-whitespace: "   {{- .Chart.Name }}    naresh"
    trailing-whitespace: "   {{ .Chart.Name -}}    naresh"
    leadtrail-whitespace: "   {{- .Chart.Name -}}    naresh"    

cd $HOME

# Helm Template Command
helm template test app1/    
```


## indent and nindent functions
- **indent:** The [indent function](https://helm.sh/docs/chart_template_guide/function_list/#indent) indents every line in a given string to the specified indent width. This is useful when aligning multi-line strings:
- **nindent:** The [nindent function](https://helm.sh/docs/chart_template_guide/function_list/#nindent) is the same as the indent function, but prepends a new line to the beginning of the string.

```yaml

vi $HOME/app1/templates/deployment.yaml ## add the below under metadata & spec section of yaml 

# indent and nindent functions
  annotations:
    # indent function
    indenttest: "  {{- .Chart.Name | indent 4 -}}  "
    # nindent function
    nindenttest: "  {{- .Chart.Name | nindent 4 -}}  "  

cd $HOME

# Helm Template Command
helm template myapp101 .    
```


## Template Function: toYaml 
- **toYaml:** 
- We can use [toYaml function](https://helm.sh/docs/chart_template_guide/function_list/#type-conversion-functions) inside the helm template actions to convert an object into YAML.
- Convert list, slice, array, dict, or object to indented yaml. 
```yaml

vi $HOME/app1/values.yaml
# Resources for testing Template Function: toYaml 
resources: 
  limits:
    cpu: 100m
    memory: 128Mi
  requests:
    cpu: 100m
    memory: 128Mi
vi $HOME/app1/templates/deployment.yaml
# deployment.yaml
    spec:
      containers:
      - name: nginx
        image: lerndevops/samples:unapp
        ports:
        - containerPort: 80
        resources: 
        {{- toYaml .Values.resources | nindent 10}}



cd $HOME
helm template test app1/

# Helm Install with --dry-run
helm install test app1/ --dry-run

# Helm Install
helm install test app1/ --atomic

# List k8s Pods
kubectl get pods 

# Describe Pod
kubectl describe pod <POD-NAME>

# Helm Uninstall
helm uninstall test
```