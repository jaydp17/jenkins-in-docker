<img src="https://wiki.jenkins-ci.org/download/attachments/78676506/docker-jenkins.png" alt="Jenkins using Docker" width="180" title="Jenkins using Docker" align="right" />

# Jenkins master/slave with Docker
[![Travis](https://img.shields.io/travis/jaydp17/jenkins-in-docker.svg)](https://travis-ci.org/jaydp17/jenkins-in-docker)
[![Image Stats](https://images.microbadger.com/badges/image/jaydp17/jenkins-master.svg)](https://hub.docker.com/r/jaydp17/jenkins-master)
[![license](https://img.shields.io/github/license/jaydp17/jenkins-in-docker.svg)]()

jenkins-in-docker a.k.a [jaydp17/jenkins-master](https://hub.docker.com/r/jaydp17/jenkins-master) sets up a container running Jenkins master that can use the host docker engine to create/connect to Jenkins slaves running as containers.

It is built on top of the original [Jenkins image](https://hub.docker.com/_/jenkins/), thus whatever is possible with it is also possible with this image.

## Usage
To run it:
```sh
$ docker run -d -p 8080:8080 -p 50000:50000 -v /var/run/docker.sock:/tmp/docker.sock:ro --privileged jaydp17/jenkins-master
```

Or if you prefer docker-compose:
```yml
jenkins-master:
  image: jaydp17/jenkins-master
  privileged: true
  ports:
    - "8080:8080"
    - "50000:50000"
  volumes:
    - /var/run/docker.sock:/var/run/docker.sock:ro
```

As with the base [Jenkins image](https://hub.docker.com/_/jenkins/) it stores the workspace in `/var/jenkins_home`. All Jenkins data lives in there - including plugins and configuration. You will probably want to make that a persistent volume (recommended)

Example:
```sh
$ docker run -d -p 8080:8080 -p 50000:50000 -v /your/home:/var/jenkins_home -v /var/run/docker.sock:/tmp/docker.sock:ro --privileged jaydp17/jenkins-master
```

Example using docker-compose
```yml
jenkins-master:
  image: jaydp17/jenkins-master
  privileged: true
  ports:
    - "8080:8080"
    - "50000:50000"
  volumes:
    - /var/run/docker.sock:/var/run/docker.sock:ro
    - /your/home:/var/jenkins_home
```

This will store the jenkins data in `/your/home` on the host.


## How to configure Jenkins to use a Docker image as slave?
Refer to [Docker in Jenkins](DOCKER-IN-JENKINS.md)


## Troubleshooting

### GitHub private repo access
Make sure you have `~/.ssh/id_rsa` & `~/.ssh/id_rsa.pub` in `$JENKINS_HOME` (i.e. `/var/jenkins_home/`).
Now ssh into the container and run
```sh
# test if the connection is establesed
$ ssh -T git@github.com
```

If the above works perfectly, your jenkins instance should be able to connect to your private repo on Github