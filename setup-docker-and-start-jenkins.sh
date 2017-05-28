#!/bin/sh
set -e

# Forum discussion: https://forums.docker.com/t/docker-inside-jenkins-container/3583/2
# Ref: https://github.com/SvenDowideit/docs-automation/blob/master/jenkins/setup-docker-and-start-jenkins.sh

JUSER="jenkins"

DOCKER_GID=$(ls -aln /var/run/docker.sock  | awk '{print $4}')

if ! getent group $DOCKER_GID; then
	echo creating docker group $DOCKER_GID
	addgroup --gid $DOCKER_GID docker
fi

if ! getent group $GID; then
	echo creating $JUSER group $GID
	addgroup --gid $GID $JUSER
fi

if ! getent passwd $JUSER; then
	echo useradd -N --gid $GID -u $UID $JUSER
	useradd -N --gid $GID -u $UID $JUSER
fi

DOCKER_GROUP=$(ls -al /var/run/docker.sock  | awk '{print $4}')
if ! id -nG "$JUSER" | grep -qw "$DOCKER_GROUP"; then
	adduser $JUSER $DOCKER_GROUP
fi

chown -R $JUSER:$JUSER /var/jenkins_home/

exec su $JUSER -c "/bin/tini -- /usr/local/bin/jenkins.sh"