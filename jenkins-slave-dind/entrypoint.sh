#!/bin/sh
set -e
echo "starting dockerd..."
sudo dockerd --host=unix:///var/run/docker.sock --host=$DOCKER_HOST --storage-driver=vfs &
echo "starting jnlp slave..."
exec java -jar /usr/share/jenkins/slave.jar \
-jnlpUrl $JENKINS_URL/computer/$JENKINS_SLAVE_NAME/slave-agent.jnlp \
	-secret $JENKINS_SLAVE_SECRET
