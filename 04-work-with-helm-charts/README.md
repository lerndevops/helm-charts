## Helm Chart?

> **The main building block of Helm based deployments are `Helm Charts:` these charts describe a configurable set of dynamically generated Kubernetes resources.** 

> **A Chart is a Helm package. It contains all of the resource definitions necessary to run an application, tool, or service inside a Kubernetes cluster.**

* ***This includes YAML configuration files for***
    * deployments, 
    * services, 
    * secrets, 
    * config maps etc.. that define the desired state of your application

> **Think of it like the Kubernetes equivalent of a Homebrew formula, an Apt dpkg, or a Yum RPM file.**

> **A Helm chart packages together YAML files and templates that can be used to generate additional configuration files based on parametrized values.**

> **This allows you to customize configuration files to suit different environments and to create reusable configurations for use across multiple deployments.**

> **Additionally, each Helm chart can be versioned and managed independently, making it easy to maintain multiple versions of an application with different configurations.**

> **The charts can either be `stored locally` or `fetched from remote chart repositories`.**

## Work With Helm Charts

1. [helm-chart-repositories](https://github.com/lerndevops/helm-charts/blob/main/04-work-with-helm-charts/01-helm-chart-repositories.md)
2. [install-chart-from-repo](https://github.com/lerndevops/helm-charts/blob/main/04-work-with-helm-charts/02-install-helm-charts-from-repo.md)
3. [upgrade-&-rollback-helm-chart](https://github.com/lerndevops/helm-charts/blob/main/04-work-with-helm-charts/03-upgrade-&-rollback-helm-chart.md)

uninstall-chart