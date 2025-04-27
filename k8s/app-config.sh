kubectl create secret generic app-config \
  --from-literal=PRING_DATASOURCE_PASSWORD: db-password \
  --from-literal=SPRING_DATASOURCE_URL: jdbc:postgresql://postgres:5432/ecommerce \
  --from-literal=SPRING_DATASOURCE_USERNAME: db-user