{{/* Common labels */}}

{{- define "ntchart4.labels" -}}
helm.sh/chart: {{ include "ntchart4.chart" . }}
{{ include "ntchart4.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/* Selector labels */}}

{{- define "ntchart4.selectorLabels" -}}
app.kubernetes.io/name: {{ include "ntchart4.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}
