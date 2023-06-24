# specify base image
FROM node

# set container working directory for subsequent commands
WORKDIR /app

# copy package.json so "npm install" can run
# this is an optimization such that if the dependencies don't change then docker doesn't create
# new image layers and will only do so from the copy source code command down below
COPY package.json /app

# get all dependencies for the project
RUN npm install

# copy from host directory to container directory (/app could be replaced by . thanks to previous WORKDIR)
COPY . /app

# port 80 of the container is has to be mapped to a host port
# only for documentation, it doesn't actually do anything
EXPOSE 80

# not executed when the image is created but when the container starts running
# if not specified, the CMD of the base image would run instead
# should always be the last instruction
CMD ["node", "server.js"]
