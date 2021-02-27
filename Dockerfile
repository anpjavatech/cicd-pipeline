FROM openjdk:8-jdk-alpine
ARG JAR_FILE=target/cicd-pipeline-1.jar
COPY ${JAR_FILE} cicd-pipeline.jar
EXPOSE 8080
ENTRYPOINT ["java","-jar","/cicd-pipeline.jar"]