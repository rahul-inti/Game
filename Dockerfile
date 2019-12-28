FROM ubuntu:latest
RUN apt-get -y update && apt-get -y upgrade
RUN apt-get -y install openjdk-8-jdk wget
RUN mkdir /usr/local/tomcat
RUN wget https://www-eu.apache.org/dist/tomcat/tomcat-9/v9.0.30/bin/apache-tomcat-9.0.30.tar.gz -O /tmp/tomcat.tar.gz
RUN cd /tmp && tar xvfz tomcat.tar.gz
RUN cp -Rv /tmp/apache-tomcat-9.0.30/* /usr/local/tomcat/
RUN mkdir /usr/local/tomcat/webapps/Ganmeoflife
ADD ./target/SampleCode-1.0.jar /usr/local/tomcat/webapps/Ganmeoflife/
EXPOSE 8080
CMD /usr/local/tomcat/bin/catalina.sh run