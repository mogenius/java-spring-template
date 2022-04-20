# https://spring.io/guides/gs/spring-boot-docker/

FROM openjdk:17-jdk-alpine

WORKDIR /usr/src/app

COPY . .

RUN addgroup   --system --gid 1001 appuser
RUN adduser  --system --uid  1001   --group appuser
RUN  chown -R appuser:appuser /opt
RUN mkdir /logs && chown -R appuser:appuser /logs

USER 1001

RUN ./mvnw package

ENTRYPOINT ["java","-jar","/usr/src/app/target/demo-0.0.1-SNAPSHOT.jar"]
