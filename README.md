# Jenkins setup Using Docker 🐳

This repo contains files required to build and run a personalized Jenkins instance.

## How to run?
```sh
# set the port on which it should run
$ echo "PORT=6000" > .env

$ docker-compose build

$ docker-compose up -d
```

## How to check logs?
```sh
$ docker-compose logs -f
```

## Troubleshooting
In case you receive an error saying `Permission denied - /var/jenkins_home/copy_reference_file.log`
```sh
# grant permission to jenkins user to access to mounted volume
$ sudo chown -R 1000 data/
```
