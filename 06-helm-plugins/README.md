## Helm Plugins 

> **A Helm plugin is a tool that can be accessed through the helm CLI, but which is not part of the built-in Helm codebase.**

[AVAILABLE-HELM-PLUGINS-LIST](https://helm.sh/docs/community/related/#helm-plugins)

> **Helm plugins are add-on tools that integrate seamlessly with Helm. They provide a way to extend the core feature set of Helm, but without requiring every new feature to be written in Go and added to the core tool.**

> **Helm plugins have the following features:**

1. **They can be added and removed from a Helm installation without impacting the core Helm tool.**
2. **They can be written in any programming language.**
3. **They integrate with Helm, and will show up in helm help and other places.**

### helm dashboard plugin 

> **Helm Dashboard is an open-source project which offers a UI-driven way to view the installed Helm charts, see their revision history and corresponding k8s resources.**

> **Also, you can perform simple actions like roll back to a revision or upgrade to newer version.**

```sh 
# list the plug ins installed 
helm plugin list 
```
```sh 
# install plugin 
helm plugin install https://github.com/komodorio/helm-dashboard.git
```
```sh
# update plugin 
helm plugin update dashboard
```
```sh
## start the dashboard application 
helm dashboard --bind 0.0.0.0 --port 9080 --no-browser
```
```sh
## access the helm dashboard 
## open any browser on your desktop/laptop 

http://<your-server-ip>:9080
```
```sh 
## uninstall the plugin 
```

## Helm diff Plugin 

> **This is a Helm plugin giving you a preview of what a helm upgrade would change.**

> **It basically generates a diff between the latest deployed version of a release and a helm upgrade --debug --dry-run.**

> **This can also be used to compare two revisions/versions of your helm release.**

```sh 
#install the plugin 
helm plugin install https://github.com/databus23/helm-diff

# list the plugins 
helm plugin list 
```

