#!/bin/bash
#JAVA_OPTS=$JAVA_OPTS -Djava.net.preferIPv4Stack=true -Djava.net.preferIPv4Addresses
JENKINS_PREFIX=/
exec java $JAVA_OPTS -jar /usr/share/jenkins/jenkins.war --prefix=$JENKINS_PREFIX
