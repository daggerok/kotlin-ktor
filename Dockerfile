#FROM openjdk:8u131-jre-alpine
FROM openjdk:14-ea-8-jdk-alpine3.10
MAINTAINER Maksim Kostromin https://github.com/daggerok
RUN apk --update --no-cache add busybox-suid bash curl \
 && addgroup app-group \
 && adduser -h /home/app -s /bin/bash -D -u 1025 app app-group
USER app
WORKDIR /home/app
VOLUME ["/home/app"]
CMD java -jar ./app.jar && true
EXPOSE 8080
HEALTHCHECK --interval=15s --timeout=15s --retries=15 CMD curl -f http://127.0.0.1:8080/ || exit 1
ARG JAVA_OPTS=" -server -Xms4g -Xmx4g -XX:+UseG1GC -XX:MaxGCPauseMillis=100 -XX:+UseStringDeduplication "
ENV JAVA_OTPS="${JAVA_OPTS}"
COPY ./build/libs/*.jar ./app.jar
