FROM ubuntu:latest

#Install prerequisites
RUN apt-get -y update
RUN apt-get -y install openjdk-8-jdk wget
RUN apt-get -y install curl
RUN mkdir /usr/local/tomcat
RUN wget https://downloads.apache.org/tomcat/tomcat-10/v10.0.27/bin/apache-tomcat-10.0.27.tar.gz -O /tmp/tomcat.tar.gz
RUN cd /tmp
RUN tar xvfz /tmp/tomcat.tar.gz -C /tmp
RUN cp -Rv /tmp/apache-tomcat-10.0.27/* /usr/local/tomcat/

EXPOSE 8080
# java home dir
ENV JAVA_HOME /usr/lib/jvm/java-8-openjdk-amd64

CMD ["bash"]
MAINTAINER ilarionb@gmail.com
WORKDIR /usr/local/tomcat/webapps

COPY hello-world-war-1.0.0.war /tmp/hello-world-war.war
RUN cp /tmp/hello-world-war.war /usr/local/tomcat/webapps/hello-world-war.war

CMD ["/usr/local/tomcat/bin/catalina.sh", "run"]
