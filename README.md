# udemy-docker-kubernetes
Working on the Udemy course "Docker &amp; Kubernetes: The Practical Guide [2023 Edition]"


# Cheatsheet

## Basic commands
- `docker build .` - Builds a docker image using the Dockerfile from the current working directory.
- `docker run <image>` - Run a container of `<image>`. `<image>` can be an image ID or name.
- `docker run <repository>:<version>` - Run a container of the image `<repository>` but specifically the version `<version>`. `<repository>` should be an image name or an URL to an image but not an image ID.
- `docker ps` - Shows all currently running containers.
- `docker ps -a` - Shows all containers (running or stopped).
- `docker images` - Shows all docker images stored in the local machine.
- `docker pull <repository>:<version>` - Pulls the image `<repository>:<version>` from the internet into your local machine.
- `docker push <repository>:<version>` - Pushes the image tagged as `<repository>:<version>` to the docker registry at `<repository>`.

## docker build options
`docker build [OPTIONS] PATH` - Builds a docker image in `PATH` using `[OPTIONS]`.

- `-t <repository>:<version>` - Builds an image and tags it with the tag `<repository>:<version>`. `<repository>` may be simply a name if it's not going to be pushed to a docker registry or it has to be an URL to a docker registry`.


## docker run options
`docker run [OPTIONS] <image>:<tag>` - Run a container of `<image>` but specifically the version `<tag>` with a list of `[OPTIONS]`.

- `--name <name>` - Assigns the specified `<name>` to the created container.
- `-p <host_port>:<container_port>` - Maps the host's `<host_port>` to the container's `<container_port>`.
- `--rm` - Will delete the container once it's stopped and all associated anonymous volumes.
- `-v <container_directory>` - Uses an anonymous volume for `<container_directory>`.
- `-v <volume_name>:<container_directory>` - Uses a named volume `<volume_name>` for `<container_directory>`.
- `-v <host_directory>:<container_directory>` - Binds the host's `<host_directory>` to the container's `<container_directory>` as a volume.

## Volumes
- `docker volume ls` - List all volumes managed by docker (named and anonymous).
- `docker volume rm <volume>` - Delete the volume `<volume>`. `<volume>` can be either an ID or a name.
- `docker volume inspect <volume>` - Show information about `<volume>`. `<volume>` can be either an ID or a name.
- `VOLUME ["<container_directory>"]` - In a Dockerfile, creates an anonymous volume for the container's `<container_directory`.
