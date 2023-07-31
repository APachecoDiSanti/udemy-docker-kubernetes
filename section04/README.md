# How to run

First build the docker image and tag it:
```sh
docker build -t favorites-node:latest .
```

Then, create the `favorites-net` network:
```sh
docker create network favorites-net
```

Then, run the `mongodb` container:
```sh
docker run \
--name mongodb \
-d \
--network favorites-net \
mongo
```

Finally, run the app container:
```sh
docker run \
--name favorites \
-d \
--rm \
--network favorites-net \
-p 80:3000 \
favorites-node
```

This will:
1. Name the container.
2. Run in detach mode.
3. Remove the container and delete anonymous volumes after it stops running.
4. Add this container to the `favorites-net` docker network so it can communicate with the `mongodb` container.
5. Map the host's port 80 to the container's port 3000.
