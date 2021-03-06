{{- define "deployment" }}
apiVersion: apps/v1
kind: Deployment
metadata:
  creationTimestamp: null
  labels:
    app: spring-boot-grpc-service
    backstage.io/kubernetes-id: spring-boot-grpc-service
    slot: {{ .slot }}
  name: spring-boot-grpc-service-{{ .slot }}
spec:
  replicas: 1
  selector:
    matchLabels:
      app: spring-boot-grpc-service
  strategy: {}
  template:
    metadata:
      creationTimestamp: null
      labels:
        app: spring-boot-grpc-service
        backstage.io/kubernetes-id: spring-boot-grpc-service
        slot: {{ .slot }}
    spec:
      containers:
      - image: {{ .Values.config.image }}
        imagePullPolicy: IfNotPresent
        name: spring-boot-grpc-service
        resources: {}
        ports:
          - containerPort: 8080 
        readinessProbe:
          httpGet:
            path: /actuator/health
            port: 8080
          periodSeconds: 5
status: {}
{{- end }}
