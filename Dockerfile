From ubuntu
WORKDIR /opt/tomcat/.jenkins/workspace/hello-world-war_master/target
COPY . . 
Run docker run -d Hello_world_war
