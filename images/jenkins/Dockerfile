# VERSION 1.1
# DOCKER-VERSION  1.2.0
# AUTHOR:         Richard Lee <lifuzu@gmail.com>
# DESCRIPTION:    Image with Jenkins project and dependecies

FROM weimed/docker-base:latest

MAINTAINER Richad Lee "lifuzu@gmail.com"

ENV DEBIAN_FRONTEND noninteractive

# Install Jenkins
RUN     wget -q -O - http://pkg.jenkins-ci.org/debian/jenkins-ci.org.key | sudo apt-key add -
RUN     echo deb http://pkg.jenkins-ci.org/debian binary/ > /etc/apt/sources.list.d/jenkins.list
RUN     apt-get update 
RUN     apt-get install -y jenkins

RUN     mkdir -p /var/jenkins_home && chown -R jenkins /var/jenkins_home
ADD     init.groovy /tmp/WEB-INF/init.groovy
RUN     cd /tmp && zip -g /usr/share/jenkins/jenkins.war WEB-INF/init.groovy
ADD     jenkins.sh /usr/local/bin/jenkins.sh
RUN     chmod +x /usr/local/bin/jenkins.sh
USER    jenkins

# VOLUME /var/jenkins_home - bind this in via -v if you want to make this persistent.
ENV     JENKINS_HOME /var/jenkins_home

# define url prefix for running jenkins behind Apache (https://wiki.jenkins-ci.org/display/JENKINS/Running+Jenkins+behind+Apache)
ENV     JENKINS_PREFIX /

# for main web interface:
EXPOSE  8080

# will be used by attached slave agents:
EXPOSE  50000

CMD ["/usr/local/bin/jenkins.sh"]
