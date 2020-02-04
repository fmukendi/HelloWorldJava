#1 Build JAR
#   /target/hello-world-rest-api.jar
#2 Set up Prequisiste for running JAR
#  - openjdk:8-jdk-alpine
#3 COPY the JAR
#4 Run the JAR

#Dockerfile Content
# c for command
# sh for shell
FROM openjdk:8-jdk-alpine
ADD target/hello-world-rest-api.jar hello-world-rest-api.jar
ENTRYPOINT ["sh", "-c", "java -jar /hello-world-rest-api.jar"]