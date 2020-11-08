## Stage 1 : build with maven builder image with native capabilities
FROM quay.io/quarkus/centos-quarkus-maven:19.3.1-java11 AS build
COPY src /usr/src/app/src
COPY pom.xml /usr/src/app
USER root
RUN chown -R quarkus /usr/src/app
USER quarkus
RUN mvn -f /usr/src/app/pom.xml clean package -DskipTests

FROM openjdk:11
EXPOSE 8080
RUN mkdir /app
COPY --from=build target/lib/* /app/lib/
COPY --from=build /usr/src/app/target/*-runner.jar /app/app.jar
ENTRYPOINT ["java", "-jar", "/app/app.jar"]
