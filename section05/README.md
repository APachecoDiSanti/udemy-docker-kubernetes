# Dockerizing a multi-container application

## Create a network for all containers to communicate

```sh
docker network create goals-net
```

## MongoDB - Persist data with a volume

```sh
docker run \
--name goals-db \
-d \
-v /data/db \
--network goals-net \
mongo
```
1. Use an anonymous volume to persist data written to the container's `/data/db` directory by the mongo database.
2. Connect the container to the `goals-net` network so it can interact with other containers.

## Backend - Connect to database and frontend

```sh
docker build \
-t goals-backend:latest \
.
```

```sh
docker run \
--name goals-be \
-d \
--rm \
-p 80:80 \
-v /app/node_modules \
-v $PWD/logs:/app/logs \
-v $PWD:/app:ro \
--network goals-net \
goals-backend
```

1. Add `nodemon` dependency so we can automatically restart the node application when there are source code changes.
2. Add bind volumes for `logs` and `node_modules` so the container can write to them.
3. Add a read-only bind volume so we can update source code from our local and have it reflected in the running container.
4. Connect to `goals-net` network so it can interact with frontend and database.
We need to expose port 80 so the client javascript application can reach the backend.

## Frontend - Connect to backend

```sh
docker build \
-t goals-frontend:latest \
.
```

```sh
docker run \
--name goals-fe \
-d \
--rm \
-p 3000:3000 \
-v /app/node_modules \
-v $PWD:/app:ro \
--network goals-net \
goals-frontend
```
