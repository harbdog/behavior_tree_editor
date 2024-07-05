FROM node:11-slim

COPY ./docker/sources.list /etc/apt/sources.list
RUN apt update && apt install -y git

USER node
WORKDIR /home/node

COPY *.json *.js ./

RUN npm install           \
    && npm install bower  \
    && npx bower install

COPY . .

RUN npx gulp build

ENTRYPOINT npx gulp serve
