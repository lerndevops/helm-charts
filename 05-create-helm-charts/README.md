## Creating Helm Charts 

- **as we now understood that a `Helm Chart` is collection of `kubernetes manifest yaml files` put it into pre defined directory structure**

- **we can create/develop these chart by using**
   * ***regular kubernetes manifest yaml files placed into the chart directory structure as they are***
   * ***`OR`***
   * ***we can also templatize these yaml files to pass values dynamically by using `helm template language`***

---
01. [understand-helm-chart-structure](00-helm-chart-structure/README.md)
02. [create-helm-chart-manual](01-create-helm-chart-manual/README.mdmd)
03. [helm-create](02-helm-create/README.md)
04. [understand-NOTES.txt](03-understand-NOTES.txt/README.md)
05. [helm-chart-built-in-objects](04-built-in-objects/README.md)
06. [helm-chart-templates](05-helm-chart-template-functions/README.md)