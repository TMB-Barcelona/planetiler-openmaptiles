# 1. Etapa de build
FROM maven:3.9.4-eclipse-temurin-21 AS builder

WORKDIR /app

COPY . /app

# Compila amb Maven (package)
RUN mvn clean package -DskipTests

# 2. Etapa de runtime
FROM eclipse-temurin:21-jre-alpine

WORKDIR /opt/planetiler

# Copia el jar amb dependencies (assembly "with-deps")
COPY --from=builder /app/target/planetiler-openmaptiles-*-jar-with-dependencies.jar ./planetiler.jar

# Entrypoint i variables per defecte
ENTRYPOINT ["java","-jar","/opt/planetiler/planetiler.jar"]
