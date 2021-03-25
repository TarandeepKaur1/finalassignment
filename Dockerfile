FROM openjdk:8
EXPOSE 8100
FROM openjdk:11
EXPOSE 8080
ADD target/web-application web-application.war
ENTRYPOINT ["java", "-war", "/web-application.war"]
