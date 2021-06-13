FROM gcr.io/cto-opus-frictionless-lab-47f9/helloworld@sha256:38042f470d22909fd19b2b1cee2cc5a87c4daebddcbfc115c942df91d4380a69

ENV APP_HOME=/usr/app/
ENV JAR_OPTS=""
ENV JAVA_OPTS=""

WORKDIR $APP_HOME
COPY ./target/spring-boot-hello-world-1.0.0-SNAPSHOT.jar ./app.jar
COPY Dockerfile_srv_entrypoint.sh ./
RUN chmod +x ./Dockerfile_srv_entrypoint.sh
RUN ls
EXPOSE 8080
ENTRYPOINT ["bash", "-c", "${APP_HOME}/Dockerfile_srv_entrypoint.sh"]