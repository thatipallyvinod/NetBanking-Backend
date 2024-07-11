# Use the official OpenJDK 17 image from Docker Hub
FROM maven:3.3-openjdk-17 AS build
COPY ..
RUN mvn clean package  -DskipTests
FROM openjdk:17.0.1-jdk-slim
COPY --from= build /target/EBANKING-SERVICE-0.0.1-SNAPSHOT.jar EBANKING-SERVICE.jar
ARG JAR_FILE=target/*.jar
ADD ${JAR_FILE} app.jar



# Run the Spring Boot application when the container starts
ENTRYPOINT ["java","-jar","/app.jar"]
