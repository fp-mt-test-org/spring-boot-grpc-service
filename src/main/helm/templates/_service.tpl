{{- define "service" }}
apiVersion: v1
kind: Service
metadata:
  creationTimestamp: null
  labels:
    app: spring-boot-grpc-service
    backstage.io/kubernetes-id: spring-boot-grpc-service
    slot: {{ .slot }}
  name: spring-boot-grpc-service-{{ .slot }}
spec:
  ports:
  - name: 8080-8080
    port: 8080
    protocol: TCP
    targetPort: 8080
  selector:
    slot: {{ .slot }}
{{- end }}
