FROM java

ENV APP_HOME=/usr/app/
ENV JAR_OPTS=""
ENV JAVA_OPTS=""

WORKDIR $APP_HOME
COPY ./target/spring-boot-hello-world-1.0.0-SNAPSHOT.jar ./app.jar
COPY Dockerfile_srv_entrypoint.sh ./
RUN chmod +x ./Dockerfile_srv_entrypoint.sh
EXPOSE 8080
ENTRYPOINT ["bash", "-c", "${APP_HOME}/Dockerfile_srv_entrypoint.sh"]