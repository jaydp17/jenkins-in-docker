FROM jenkins:2.46.3

LABEL maintainer Jaydeep Solanki <jaydp17@gmail.com> (https://jaydp.com)

ENV JAVA_OPTS="-Xmx8192m"

COPY setup-docker-and-start-jenkins.sh /

USER root

ENTRYPOINT ["/setup-docker-and-start-jenkins.sh"]
