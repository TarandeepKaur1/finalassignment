FROM tomcat:8.0-alpine
MAINTAINER Tarandeep Kaur
RUN apk update
RUN apk add wget
RUN wget --user=admin --password=Mummypapa123@ -O /usr/local/tomcat/webapps/assignmentdocker.war http://172.25.64.1:8082/artifactory/assignmentrepo/com/nagarro/application/web-application/0.0.1-SNAPSHOT/web-application-0.0.1-20210327.052854-1.war
EXPOSE 8080
CMD /usr/local/tomcat/bin/catalina.sh run
