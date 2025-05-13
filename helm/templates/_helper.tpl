{{/*
Return the fully qualified app name.
If fullnameOverride is provided in values.yaml, it will be used; otherwise, it combines the
release name and either nameOverride or the chart name.
*/}}
{{- define "simple-ecommerce.fullname" -}}
{{- if .Values.fullnameOverride -}}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- $name := default .Chart.Name .Values.nameOverride -}}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- end }}

{{/*
Return a chart identifier that includes the chart name and version.
*/}}
{{- define "simple-ecommerce.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | trimSuffix "-" -}}
{{- end }}