{{/* Common Labels */}}
{{- define "nt.labels"}}
    app: sapp
    cname: {{ .Chart.Name }}
{{- end }}
