FROM node:14-alpine

COPY $PWD/hh /usr/src/app

RUN apk update && apk add git;

WORKDIR /usr/src/app

RUN yarn install --non-interactive --frozen-lockfile

RUN yarn deploy:local

COPY $PWD/docker/entrypoint.sh /usr/local/bin

ENTRYPOINT ["/bin/sh", "/usr/local/bin/entrypoint.sh"]
