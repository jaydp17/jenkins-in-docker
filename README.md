# Jenkins setup Using Docker 🐳

This repo contains files required to build and run a personalized Jenkins instance.

## How to run?
### Jenkins Master
```sh
# set the port on which it should run
$ echo "PORT=8080" > .env

$ docker-compose build

$ docker-compose up -d
```

**Tip:** When deploying this on cloud make sure you have the port on which Jenkins is running open and port `50000` as that's used by Jenkins to connect to slaves.


### Build Jenkins Slaves
```sh
# this will create a test slave image named jenkins-slave
$ docker-compose -f docker-compose.slave.yml build
```

### How to configure Jenkins to use this Docker image as slave?
// Coming Soon

## How to check logs?
```sh
$ docker-compose logs -f
```

## Troubleshooting

### GitHub private repo access
Make sure you have `~/.ssh/id_rsa` & `~/.ssh/id_rsa.pub` in `$JENKINS_HOME` (i.e. `/var/jenkins_home/`).
Now ssh into the container and run
```sh
# test if the connection is establesed
$ ssh -T git@github.com
```

If the above works perfectly, your jenkins instance should be able to connect to your private repo on Github