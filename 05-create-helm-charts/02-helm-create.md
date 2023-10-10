## let's create a simple helm chart with `helm create`
```sh
helm create $HOME/mychart2
```
```sh 
apt-get install -y tree 
tree $HOME/mychart2/
```
```sh
# observe the files & directories created by helm create as below 
mychart2/
├── Chart.yaml
├── charts
├── templates
│   ├── NOTES.txt
│   ├── _helpers.tpl
│   ├── deployment.yaml
│   ├── hpa.yaml
│   ├── ingress.yaml
│   ├── service.yaml
│   ├── serviceaccount.yaml
│   └── tests
│       └── test-connection.yaml
└── values.yaml
```
## helm show / inspect 
- **helps to read/know the chart information before installing**
```t

helm show <sub-command> <chart>

Available sub Commands:
  all         show all information of the chart
  chart       show the chart's definition
  crds        show the chart's CRDs
  readme      show the chart's README
  values      show the chart's values
```

```sh
helm show chart $HOME/mychart2
```
```yaml
## output can be observed as below 
apiVersion: v2
appVersion: 1.16.0
description: A Helm chart for Kubernetes
name: mychart2
type: application
version: 0.1.0
```
```sh
helm show values $HOME/mychart2
```
```yaml 
## output can be observed as below 

# Default values for mychart2.
# This is a YAML-formatted file.
# Declare variables to be passed into your templates.

replicaCount: 1

image:
  repository: nginx
  pullPolicy: IfNotPresent
  # Overrides the image tag whose default is the chart appVersion.
  tag: ""

imagePullSecrets: []
< truncated further values to fit in here >
```
## helm template 
- **helps to print the template definition onto local terminal before install**

```sh
helm template $HOME/mychart2/
```
```yaml
## output can be observed as below

---
# Source: test/templates/serviceaccount.yaml
apiVersion: v1
kind: ServiceAccount
metadata:
  name: release-name-test
  labels:
    helm.sh/chart: test-0.1.0
    app.kubernetes.io/name: test
    app.kubernetes.io/instance: release-name
    app.kubernetes.io/version: "1.16.0"
    app.kubernetes.io/managed-by: Helm
  automountServiceAccountToken: true
---
# Source: test/templates/service.yaml
apiVersion: v1
kind: Service
metadata:
  name: release-name-test
  labels:
    helm.sh/chart: test-0.1.0
    app.kubernetes.io/name: test
    app.kubernetes.io/instance: release-name
    app.kubernetes.io/version: "1.16.0"
    app.kubernetes.io/managed-by: Helm
spec:
  type: ClusterIP
  ports:
    - port: 80
      targetPort: http
      protocol: TCP
      name: http
  selector:
    app.kubernetes.io/name: test
    app.kubernetes.io/instance: release-name
---
# Source: test/templates/deployment.yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: release-name-test
  labels:
    helm.sh/chart: test-0.1.0
    app.kubernetes.io/name: test
    app.kubernetes.io/instance: release-name
    app.kubernetes.io/version: "1.16.0"
    app.kubernetes.io/managed-by: Helm
spec:
  replicas: 1
  selector:
    matchLabels:
      app.kubernetes.io/name: test
      app.kubernetes.io/instance: release-name
  template:
    metadata:
      labels:
        helm.sh/chart: test-0.1.0
        app.kubernetes.io/name: test
        app.kubernetes.io/instance: release-name
        app.kubernetes.io/version: "1.16.0"
        app.kubernetes.io/managed-by: Helm
    spec:
      serviceAccountName: release-name-test
      containers:
        - name: test
          image: "nginx:1.16.0"
          livenessProbe:
            httpGet:
              path: /
              port: http
          readinessProbe:
            httpGet:
              path: /
              port: http
```

## helm lint 
- **helps to validate chart syntax are rite, shows if any errors**
- **note that only the charts in local can be linted/validated**

```sh 
helm lint $HOME/mychart2/
```

```sh
## output can be observed as below 

==> Linting test/
[INFO] Chart.yaml: icon is recommended

1 chart(s) linted, 0 chart(s) failed
```