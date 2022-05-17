FROM node:16.15.0-bullseye-slim
LABEL maintainer="Takashi Makimoto <mackie@beehive-dev.com>"

SHELL ["/bin/bash", "-o", "pipefail", "-c"]

EXPOSE 1337

COPY ./app /app
RUN chown -R node:node /app

USER node
WORKDIR /app

RUN \
  yarn install && \
  yarn build

CMD ["yarn", "start"]
