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

### local chart
```t
helm create mychart1
```
```
helm show all mychart1 
helm show values mychart1
```
```yaml
helm show chart mychart1

devops@kube-master:~$ helm show chart mychart1
apiVersion: v2
appVersion: 1.16.0
description: A Helm chart for Kubernetes
name: mychart1
type: application
version: 0.1.0
```

## helm template 
- **helps to print the template definition onto local terminal before install**

### local chart

```yaml 

#helm template <chart-name>
helm create mychart1
helm template mychart1/

devops@kube-master:~$ helm template mychart1/
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
#helm lint chartname/
helm create mychart1

helm lint mychart1/

devops@kube-master:~$ helm lint mychart1/
==> Linting test/
[INFO] Chart.yaml: icon is recommended

1 chart(s) linted, 0 chart(s) failed
```