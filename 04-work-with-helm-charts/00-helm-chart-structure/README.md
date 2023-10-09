## Understand Helm Chart Folder Structure

### create a helm chart 

```t
# Helm Create Chart
    helm create <CHART-NAME>
    helm create testchart
```

### Helm Chart Structure can be found as below 

1. **we can observe the `helm create` command creates chart directory structure with various files & directories as below**
1. **not every file or directory inside the test chart directory are mandatory**
2. **as mentioned below only `Chart.yaml` & `templates directory` are mandatory. rest all are optional, we can use them accordingly**
3. **each file & directory has thier own purpose & meaning. we will understand them as we create the charts**

```t
└── testchart
    ├── .helmignore
    ├── Chart.yaml                  -- mandatory file 
    ├── LICENSE
    ├── README.md
    ├── charts
    ├── templates                   -- mandatory directory
    │   ├── NOTES.txt
    │   ├── _helpers.tpl
    │   ├── deployment.yaml
    │   ├── hpa.yaml
    │   ├── ingress.yaml
    │   ├── service.yaml
    │   ├── serviceaccount.yaml
    │   └── tests
    │       └── test-connection.yaml
    └── values.yaml
```

#### `Chart.yaml`:          **Contains metadata about the chart itself: its name, the chart version, a description, and similar details. In Helm 3 it can contain dependencies as well.**
#### `templates`:           **A directory of templates that, when combined with values, will generate valid Kubernetes manifest files.**
#### `templates/NOTES.txt`: **The "help text" for your chart. This will be displayed to your users when they run helm install**
#### `charts/`:             **A directory containing any charts upon which this chart depends.**
#### `LICENSE`:             **OPTIONAL: A plain text file containing the license for the chart**
#### `README.md`:           **OPTIONAL: A human-readable README file**
#### `values.yaml`:         **Contains configuration settings for the chart.**
#### `templates/deployment.yaml`: **A basic manifest for creating a Kubernetes deployment**
#### `templates/service.yaml`: **A basic manifest for creating a service endpoint for your deployment**
#### `templates/_helpers.tpl`: **A place to put template helpers that you can re-use throughout the chart**

## [know your chart](https://github.com/lerndevops/helm-charts/blob/main/04-work-with-helm-charts/00-helm-chart-structure/know-your-chart.md) 

