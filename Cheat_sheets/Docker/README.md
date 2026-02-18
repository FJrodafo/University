# Docker

## Index

1. [Docker Hub & GitHub Packages](#docker-hub--github-packages)
    1. [Login](#login)
    2. [Build](#build)
    3. [Tag](#tag)
    4. [Push](#push)
    5. [Pull](#pull)
10. [Additional information](#additional-information)

## Docker Hub & GitHub Packages

#### Login

```shell
# Docker Hub
echo "DOCKER_TOKEN" | docker login --username fjrodafo --password-stdin
```

```shell
# GitHub Packages (GitHub Container Registry)
echo "GITHUB_TOKEN" | docker login ghcr.io -u fjrodafo --password-stdin
```

#### Build

```shell
docker build -t docker-app:latest .
```

#### Tag

```shell
# Docker Hub
docker tag docker-app:latest fjrodafo/docker-app:v1.0.0
```

```shell
# GitHub Packages
docker tag docker-app:latest ghcr.io/fjrodafo/docker-app:v1.0.0
```

#### Push

```shell
# Docker Hub
docker push fjrodafo/docker-app:v1.0.0
```

```shell
# GitHub Packages
docker push ghcr.io/fjrodafo/docker-app:v1.0.0
```

#### Pull

```shell
# Docker Hub
docker pull fjrodafo/docker-app:v1.0.0
```

```shell
# GitHub Packages
docker pull ghcr.io/fjrodafo/docker-app:v1.0.0
```

## Additional information

This cheat sheet is available on GitHub Gist at https://gist.github.com/FJrodafo/3b50a365587223e74cd8d93da960f867

Explore more gists by Francisco José Rodríguez Afonso at https://gist.github.com/FJrodafo