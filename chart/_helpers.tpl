{{/*
Example for lookup function
*/}}
{{- define "gen.secret" -}}
{{- $secret := lookup "v1" "Secret" .Release.Namespace "sample-secret" -}}
{{- if $secret -}}
{{/*
   Reusing existing secret data
*/}}
accesskey: {{ $secret.data.accesskey }}
secretkey: {{ $secret.data.secretkey }}
{{- else -}}
{{/*
    Generate new data
*/}}
accesskey: {{ randAlphaNum 10 | b64enc }}
secretkey: {{ randAlphaNum 10 | b64enc }}
{{- end -}}
{{- end -}}