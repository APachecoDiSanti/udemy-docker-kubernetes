# Dockerizing a multi-container application

## Create a network for all containers to communicate

```sh
docker network create goals-net
```
Only mongo and the backend code need to be on the same network.

## MongoDB - Persist data with a volume

```sh
docker run \
--name goals-db \
--rm \
-d \
-v goals-data:/data/db \
--network goals-net \
-e MONGO_INITDB_ROOT_USERNAME=db_admin \
-e MONGO_INITDB_ROOT_PASSWORD=secret \
mongo
```
1. Use a named volume to persist data written to the container's `/data/db` directory by the mongo database.
2. Connect the container to the `goals-net` network so it can interact with other containers.
3. Use environment variables to pass the credentials to use the database.

**NOTE: Do not store real credentials in plain text in git as it's a bad practice! A hacker may get that information.**

## Backend - Connect to database and frontend

### Build

```sh
docker build \
-t goals-backend:latest \
.
```

### Run

```sh
docker run \
--name goals-be \
-d \
--rm \
-p 80:80 \
-v /app/node_modules \
-v $PWD/logs:/app/logs \
-v $PWD:/app:ro \
-e MONGODB_USERNAME=db_admin \
--network goals-net \
goals-backend
```

1. Add `nodemon` dependency so we can automatically restart the node application when there are source code changes.
2. Add bind volume for `logs` so the container can write to it.
3. Add an anonymous volume for `node_modules`.
3. Add a read-only bind volume so we can update source code from our local and have it reflected in the running container.
4. Connect to `goals-net` network so it can interact with frontend and database.

We need to expose port 80 so the client javascript application can reach the backend.

## Frontend - Connect to backend

### Build

```sh
docker build \
-t goals-frontend:latest \
.
```

### Run

```sh
docker run \
--name goals-fe \
-d \
--rm \
-p 3000:3000 \
-v /app/node_modules \
-v $PWD/src:/app/src:ro \
goals-frontend
```
Doesn't need to be connected to the network since the code runs in the web browser and it can't resolve container name based domains.
It will access the backend through the exposed port.

## Testing
In you web browser, go to [localhost:3000](localhost:3000).
