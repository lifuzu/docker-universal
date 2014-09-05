# VERSION 1.0
# DOCKER-VERSION  1.2.0
# AUTHOR:         Richard Lee <lifuzu@gmail.com>
# DESCRIPTION:    Image with Jenkins project and dependecies

FROM weimed/docker-base:latest

MAINTAINER Richad Lee "lifuzu@gmail.com"

ENV DEBIAN_FRONTEND noninteractive

# Set Java PATH
ENV     JAVA_HOME /usr/local/java
ENV     JRE_HOME /usr/local/java/jre
ENV     PATH $PATH:$JAVA_HOME/bin:$JRE_HOME/bin

# Add user jenkins to the image
RUN 	useradd -s /bin/bash -m jenkins
# Set password for the jenkins user (you may want to alter this).
RUN 	echo "jenkins:jenkins" | chpasswd

# do we need root permission for jenkins for docker build ?
RUN 	echo "jenkins ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers
