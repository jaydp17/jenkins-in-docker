# Docker Plugin & Jenkins

The most official looking [Docker plugin](https://wiki.jenkins-ci.org/display/JENKINS/Docker+Plugin) didn't work for me :confused:.

Install [Yet Another Docker Plugin](https://wiki.jenkins-ci.org/display/JENKINS/Yet+Another+Docker+Plugin) which seems to work and development is still going on.


## Connect to Docker Engine
After install go to `Manage Jenkins` > `Configure System`

Click on `Add a new Cloud` and select `Yet Another Docker`
![Cloud](https://s18.postimg.org/k5ryvz4zt/Screen_Shot_2017-05-30_at_2.33.27_PM.png)

Add CloudName, whatever you want.

Make sure you have `unix:///var/run/docker/sock` in `Docker URL`.

And in `Type` select `JERSEY`.

![Select Jersey](https://s3.postimg.org/pqkhv2ij7/jersey.png)

After entering all the details, click on `Test Connection`

![](https://s3.postimg.org/aoko3ci4z/Screen_Shot_2017-05-30_at_2.45.34_PM.png)

Test connection should give you the details of your docker engine.


## Provide an image to run as Docker Slave
Add a docker template
![Docker Template](https://s13.postimg.org/5rulxe98n/add-docker-template.png)

Fill in `Docker Image Name` & `Labels`

Here we are using [jaydp17/jenkins-slave](https://hub.docker.com/r/jaydp17/jenkins-slave/) as the slave image but there are various slave images available on Docker hub that could also be used.

![Docker Image Name](https://s29.postimg.org/fx2mumt6v/docker-image-and-namev2.png)


## Run task in this slave
In your job, you can configure where should that run in
![Restrict run](https://s3.postimg.org/eqgnlagdv/Screen_Shot_2017-05-30_at_3.42.01_PM.png)

**That's all**

Hit the run button and it will spawn a new container for this build, run the job inside the container and then shut the container down.