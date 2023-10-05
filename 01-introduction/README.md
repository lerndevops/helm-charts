## What is Helm?

> Helm is a tool that automates the creation, packaging, configuration, and deployment of Kubernetes applications by combining your configuration files into a single reusable package. 

> In a microservice architecture, you create more microservices as the application grows, making it increasingly difficult to manage. Kubernetes, an open source container orchestration technology, simplifies the process by grouping multiple microservices into a single deployment. Yet managing Kubernetes applications across the development lifecycle brings its own set of challenges, including version management, resource allocation, updating, and rollbacks.

> Helm provides one of the most accessible solutions to this problem, making deployments more consistent, repeatable, and reliable.

> `Helm` helps you manage Kubernetes applications with `Helm Charts` which helps you define, install, and upgrade even the most complex Kubernetes application.

## Simplifying Kubernetes management with Helm

> A container is a lightweight software component that bundles an application and its dependencies into a single image file. Containers are portable between different platforms, leading to faster application startup and easy scaling.

> Kubernetes deploys using YAML configuration files. For complex deployments with frequent updates, it can be difficult to keep track of all the different versions for these files. Helm is a handy tool that maintains a single deployment YAML file with version information. This file lets you set up and manage a complex Kubernetes cluster with a few commands

## Helm Chart 

> **The main building block of Helm based deployments are `Helm Charts:` these charts describe a configurable set of dynamically generated Kubernetes resources.** 

> A Chart is a Helm package. It contains all of the resource definitions necessary to run an application, tool, or service inside of a Kubernetes cluster. This includes YAML configuration files for deployments, services, secrets, and config maps that define the desired state of your application

> **Think of it like the Kubernetes equivalent of a Homebrew formula, an Apt dpkg, or a Yum RPM file.**

> A Helm chart packages together YAML files and templates that can be used to generate additional configuration files based on parametrized values. This allows you to customize configuration files to suit different environments and to create reusable configurations for use across multiple deployments. Additionally, each Helm chart can be versioned and managed independently, making it easy to maintain multiple versions of an application with different configurations.

> **The charts can either be stored locally or fetched from remote chart repositories.**

## Helm Release

> A running instance of a chart is known as a release. When you run the **`helm install`** command, it pulls the config and chart files and deploys all the Kubernetes resources.

> One chart can often be installed many times into the same cluster. And each time it is installed, a new release is created. Consider a MySQL chart. If you want two databases running in your cluster, you can install that chart twice. Each one will have its own release, which will in turn have its own release name.

## Helm Repository 

> A Repository is the place where charts can be collected and shared. It’s like Perl’s CPAN archive or the Fedora Package Database, but for Kubernetes packages.