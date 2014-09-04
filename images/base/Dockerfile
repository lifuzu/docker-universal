# VERSION 1.0
# DOCKER-VERSION  1.2.0
# AUTHOR:         Richard Lee <lifuzu@gmail.com>
# DESCRIPTION:    Image with Jenkins project and dependecies

FROM ubuntu:14.04

MAINTAINER Richad Lee "lifuzu@gmail.com"

ENV DEBIAN_FRONTEND noninteractive

RUN     echo "deb http://archive.ubuntu.com/ubuntu $(lsb_release -sc) main restricted universe" > /etc/apt/sources.list &&\
        echo "deb http://archive.ubuntu.com/ubuntu $(lsb_release -sc)-updates main restricted universe" >> /etc/apt/sources.list &&\
        echo "deb http://archive.ubuntu.com/ubuntu $(lsb_release -sc)-security main restricted universe" >> /etc/apt/sources.list

# Update
RUN     apt-get update
RUN     apt-get install -y wget curl zip
RUN     apt-get install -y git openssh-server
RUN     apt-get install -y build-essential make
RUN     apt-get install -y ruby rbenv
RUN     apt-get clean

# Java
# TODO: extract JAVA version
RUN     cd /tmp && \
        curl -b gpw_e24=http%3A%2F%2Fwww.oracle.com -b oraclelicense=accept-securebackup-cookie -O -L http://download.oracle.com/otn-pub/java/jdk/8u20-b26/jdk-8u20-linux-x64.tar.gz && \
        tar -zxf /tmp/jdk-8u20-linux-x64.tar.gz -C /usr/local && \
        ln -s /usr/local/jdk1.8.0_20 /usr/local/java && \
        rm /tmp/jdk-8u20-linux-x64.tar.gz

ENV     JAVA_HOME /usr/local/java
ENV     JRE_HOME /usr/local/java/jre
ENV     PATH $PATH:$JAVA_HOME/bin:$JRE_HOME/bin

# Install components
RUN     apt-get update
RUN     apt-get install -y maven ant
RUN     apt-get install -y runit monit socat
RUN     apt-get clean

RUN 	cd / && git clone https://github.com/weimed/pups.git
