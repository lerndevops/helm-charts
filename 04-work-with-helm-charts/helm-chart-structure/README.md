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

```
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
