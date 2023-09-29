FROM gradle:8.3-jdk11-alpine as BUILDER

ARG VERSION=0.0.1-SNAPSHOT

WORKDIR /build/

COPY build.gradle /build/
COPY src /build/src

RUN gradle clean assemble

COPY build/libs/spring-boot-2-${VERSION}.jar target/application.jar

FROM eclipse-temurin:11-jre-alpine

WORKDIR /app/

COPY --from=BUILDER /build/target/application.jar /app/

CMD java -jar /app/application.jar
