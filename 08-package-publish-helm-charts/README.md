## Helm chart repository

> **A chart repository is an HTTP server that houses an index.yaml file and optionally some packaged charts.**

> **When you're ready to share your charts, the preferred way to do so is by uploading them to a chart repository.**

> **Because a chart repository can be any HTTP server that can serve YAML and tar files and can answer GET requests, you have a plethora of options when it comes down to hosting your own chart repository.**

> ***For example, you can use*** 

* **a Google Cloud Storage (GCS) bucket,**
* **Amazon S3 bucket,**
* **GitHub Pages,**
* **OCI registries (ex: dockerhub),**
* **or even create your own web server.**

## The chart repository structure 

> **A chart repository consists of packaged charts and a special file called `index.yaml` which contains an index of all of the charts in the repository.** 

> **Frequently, the charts that index.yaml describes are also hosted on the same server, as are the provenance files.**

## [Create-your-chart-repository](https://helm.sh/docs/topics/chart_repository/#create-a-chart-repository)

1. **[setup-a-github-repo-as-helm-chart-repo](github/README.md)**
2. **[use-docker-hub-for-helm-charts](oci-based-registries/README.md)**