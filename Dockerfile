FROM openjdk:8
ADD target/spring-boot-jenkins-docker.jar spring-boot-jenkins-docker.jar
EXPOSE 8082
ENTRYPOINT ["java", "-jar", "spring-boot-jenkins-docker.jar"]