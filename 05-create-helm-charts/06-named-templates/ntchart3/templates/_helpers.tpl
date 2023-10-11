{{/* Common Labels */}}
{{- define "mytemplate.labels"}}
    app: sapp
    cname: {{ .Chart.Name }}
{{- end }}
