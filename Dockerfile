FROM jenkins/jenkins:2.60.1

LABEL maintainer Jaydeep Solanki <jaydp17@gmail.com> (https://jaydp.com)

ENV JAVA_OPTS="-Xmx8192m" \
  # JENKINS_URL is useful when accessing jenkins-cli
  JENKINS_URL="http://localhost:8080"

COPY setup-docker-and-start-jenkins.sh /

USER root

RUN apt-get update && apt-get install -y --no-install-recommends vim \
  && apt-get -q autoremove \
  && apt-get -q clean -y && rm -rf /var/lib/apt/lists/* && rm -f /var/cache/apt/*.bin

RUN echo 'alias jenkins-cli="java -jar /var/jenkins_home/war/WEB-INF/jenkins-cli.jar"' >> ~/.bashrc

ENTRYPOINT ["/setup-docker-and-start-jenkins.sh"]
