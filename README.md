# udemy-docker-kubernetes
Working on the Udemy course "Docker &amp; Kubernetes: The Practical Guide [2023 Edition]"


# Cheatsheet

## Dockerfile instructions
- `FROM <image>:<tag>` - First instruction, base `<image>` and specific `<tag>` version that we'll use to build on top of it our own image.
- `WORKDIR <directory>` - Set the working directory inside the image to `<directory>`.
- `COPY <host_path> <image_path>` - Copy `<host_path>` into `<image_path>` in the image. `<host_path>` may be a file or a directory.
- `RUN <command>` - Run `<command>` inside the image.
- `CMD <command>` - Run `<command>` when the container runs. `<command>` is a comma separated list of arguments within brackets (e.g.: `["npm", "start"]`).
- `EXPOSE <port>` - Documentation instruction to say that we should map the container's `<port>` to a host port when running a container of this image.
- `VOLUME ["<image_path>"]` - Creates an anonymous volume for the image's directory at `<image_path>`.
- `ARG <argument>=<value>` - Define a build argument named `<argument>` and with a default `<value>`.
- `ENV <variable>=<value>` - Define an environment variable named `<variable>` and with a default `<value>`.

## Basic commands
- `docker build .` - Builds a docker image using the Dockerfile from the current working directory.
- `docker run <image>` - Run a container of `<image>`. `<image>` can be an image ID or name.
- `docker run <repository>:<version>` - Run a container of the image `<repository>` but specifically the version `<version>`. `<repository>` should be an image name or an URL to an image but not an image ID.
- `docker ps` - Shows all currently running containers.
- `docker ps -a` - Shows all containers (running or stopped).
- `docker images` - Shows all docker images stored in the local machine.
- `docker pull <repository>:<version>` - Pulls the image `<repository>:<version>` from the internet into your local machine.
- `docker push <repository>:<version>` - Pushes the image tagged as `<repository>:<version>` to the docker registry at `<repository>`.
- `docker logs <container>` - See the logs of a container. `<container>` can be a container ID or name.
- `docker create network <name>` - Create a docker network called `<name>`.

## docker build options
`docker build [OPTIONS] PATH` - Builds a docker image in `PATH` using `[OPTIONS]`.

- `-t <repository>:<version>` - Builds an image and tags it with the tag `<repository>:<version>`. `<repository>` may be simply a name if it's not going to be pushed to a docker registry or it has to be an URL to a docker registry`.
- `--build-arg <argument>=<value>` - Set the Dockerfile's build argument called `<argument>` with this `<value>`.

## docker run options
`docker run [OPTIONS] <image>:<tag>` - Run a container of `<image>` but specifically the version `<tag>` with a list of `[OPTIONS]`.

- `--name <name>` - Assigns the specified `<name>` to the created container.
- `-p <host_port>:<container_port>` - Maps the host's `<host_port>` to the container's `<container_port>`.
- `--rm` - Will delete the container once it's stopped and all associated anonymous volumes.
- `-v <container_directory>` - Uses an anonymous volume for `<container_directory>`.
- `-v <volume_name>:<container_directory>` - Uses a named volume `<volume_name>` for `<container_directory>`.
- `-v <host_directory>:<container_directory>` - Binds the host's `<host_directory>` to the container's `<container_directory>` as a volume. `<host_directory>` must be an absolute path.
- `-e <variable>=<value>` - Use an environment variable named `<variable>` and set its `<value>`.
- `--env-file <path>` - Pass multiple environment variables defined in the file found in `<path>` to the container. Each line in the file should be a `<variable>=<value>` pair.
- `--network <name>` - Connect this container to the `<name>` network.

## Volumes
- `docker volume ls` - List all volumes managed by docker (named and anonymous).
- `docker volume rm <volume>` - Delete the volume `<volume>`. `<volume>` can be either an ID or a name.
- `docker volume inspect <volume>` - Show information about `<volume>`. `<volume>` can be either an ID or a name.
- `docker volume create <volume>` - Create a named volume manually.  `<volume>` is the name you will give the volume.
- `docker volume prune` - Delete all unused anonymous and named volumes.
