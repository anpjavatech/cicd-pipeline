FROM openjdk:8-jdk-alpine
ARG JAR_FILE=target/cicd-pipeline-1.jar
COPY ${JAR_FILE} cicd-pipeline.jar
ENTRYPOINT ["java","-jar","/cicd-pipeline.jar"]