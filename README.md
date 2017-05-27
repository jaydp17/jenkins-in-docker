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
### Permission Denied
In case you receive an error saying `Permission denied - /var/jenkins_home/copy_reference_file.log`
```sh
# grant permission to jenkins user to access to mounted volume
$ sudo chown -R 1000 data/
```

### GitHub private repo access
Make sure you have `~/.ssh/id_rsa` & `~/.ssh/id_rsa.pub` in `$JENKINS_HOME` (i.e. `/var/jenkins_home/`).
Now ssh into the container and run
```sh
# test if the connection is establesed
$ ssh -T git@github.com
```

If the above works perfectly, your jenkins instance should be able to connect to your private repo on Github