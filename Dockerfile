# https://spring.io/guides/gs/spring-boot-docker/

FROM openjdk:17-jdk-alpine

WORKDIR /usr/src/app

COPY . .

RUN ./mvnw package

ENTRYPOINT ["java","-jar","/usr/src/app/target/demo-0.0.1-SNAPSHOT.jar"]
