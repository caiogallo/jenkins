FROM azabost/android-sdk-27
ENV JENKINS_MASTER http://localhost:8080 
ENV JENKINS_SLAVE_NAME android-node
ENV JENKINS_SLAVE_SECRET ""
ENV JENKINS_HOME /home/jenkins
ENV JENKINS_REMOTING_VERSION 3.17
ENV DOCKER_HOST tcp://0.0.0.0:2375
RUN apt-get update && apt-get -y install curl bash sudo
ARG USER_HOME_DIR="/root"
# RUN useradd -h $JENKINS_HOME -s /bin/sh jenkins jenkins && chmod a+rwx $JENKINS_HOME
RUN useradd -ms /bin/bash jenkins && chmod a+rwx $JENKINS_HOME
RUN echo "jenkins ALL=(ALL) NOPASSWD: /usr/local/bin/dockerd" > /etc/sudoers.d/00jenkins && chmod 440 /etc/sudoers.d/00jenkins
RUN echo "jenkins ALL=(ALL) NOPASSWD: /usr/local/bin/docker" > /etc/sudoers.d/01jenkins && chmod 440 /etc/sudoers.d/01jenkins
RUN curl --create-dirs -sSLo /usr/share/jenkins/slave.jar http://repo.jenkins-ci.org/public/org/jenkins-ci/main/remoting/$JENKINS_REMOTING_VERSION/remoting-$JENKINS_REMOTING_VERSION.jar && chmod 755 /usr/share/jenkins && chmod 644 /usr/share/jenkins/slave.jar
COPY entrypoint.sh /usr/local/bin/entrypoint
RUN chown jenkins /opt/android-sdk-linux -R
VOLUME $JENKINS_HOME
WORKDIR $JENKINS_HOME
USER jenkins
ENTRYPOINT ["/usr/local/bin/entrypoint"]
