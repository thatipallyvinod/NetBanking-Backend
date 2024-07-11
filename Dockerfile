# Use the official Maven and OpenJDK images from Docker Hub
FROM maven:3.8.5-openjdk-17 AS build
WORKDIR /app
COPY . .
RUN mvn clean package -DskipTests

FROM openjdk:17.0.1-jdk-slim
WORKDIR /app
COPY --from=build /app/target/EBANKING-SERVICE-0.0.1-SNAPSHOT.jar EBANKING-SERVICE.jar
ARG JAR_FILE=EBANKING-SERVICE.jar
ADD ${JAR_FILE} app.jar

# Run the Spring Boot application when the container starts
ENTRYPOINT ["java","-jar","/app.jar"]
