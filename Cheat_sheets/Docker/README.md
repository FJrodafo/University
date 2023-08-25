<div align="center">
    <a href="https://www.docker.com/">
        <img alt="logo" src="https://raw.githubusercontent.com/FJrodafo/University/main/Cheat_sheets/Docker/Assets/Logo.png" />
    </a>
</div>

## Install

[Docker Engine](https://docs.docker.com/engine/)

[Docker Desktop](https://docs.docker.com/desktop/)

## Docker Hub

Docker Hub is the world's easiest way to create, manage, and deliver your team's container applications.

Browse over 100,000 container images from software vendors, open-source projects, and the community.

[Build and Ship any Application Anywhere](https://hub.docker.com/)

## Images

To download the latest [Node.js](https://hub.docker.com/_/node) image, we type the following command:

```shell
docker pull node
```

Download a specific version of Node.js, in this case version 18:

```shell
docker pull node:18
```

Sometimes Docker will throw us an error when downloading an image if we are on macOS or Windows, so, to fix it, we have to specify the download platform. In this case we will download the latest version of [MySQL](https://hub.docker.com/_/mysql):

```shell
docker pull --platform linux/x86_64 mysql
```

List all images downloaded to our computer:

```shell
docker images
```

Delete a specific image:

```shell
docker image rm node:18
```

## Containers

Before creating a container, we need to have an [image installed](#images). In this case we will download the latest version of [MongoDB](https://hub.docker.com/_/mongo):

```shell
docker pull mongo
```

Now that we have our MongoDB image downloaded, we can create our first container:

```shell
docker container create mongo
```

Run the container:

```shell
docker start container_ID
```

View the data and confirm the execution of the containers:

```shell
docker ps
```

Stop de container:

```shell
docker stop container_ID
```

Shows all existing containers regardless of whether they are running or not:

```shell
docker ps -a
```

Delete a specific container:

```shell
docker rm container_ID/Name
```

Create a container with a custom name:

```shell
docker create --name custom_Name mongo
```

Run the container with a custom name:

```shell
docker start custom_Name
```

We can also stop and remove the container with the custom name:

```shell
docker stop custom_Name
docker rm custom_Name
```

Create a container with the ports mapped:

```shell
docker create -p27017:27017 --name custom_Name mongo
```

Verify if your server ran correctly:

```shell
docker logs container_ID/Name
```

Verify if your server ran correctly with the option to keep listening:

```shell
docker logs --follow container_ID/Name
# Press 'Ctrl + C' to exit
```

We can download an image, create a container, and start it with a single command:

```shell
docker run mongo
```

We could also add an option so that it does not show us the logs:

```shell
docker run -d mongo
```

Finally we could mix all the commands and options for our MongoDB container:

```shell
docker run --name custom_Name -p27017:27017 -d mongo
```