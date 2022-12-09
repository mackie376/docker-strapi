FROM node:18.12.1-bullseye-slim
LABEL maintainer="Takashi Makimoto <mackie@beehive-dev.com>"

ARG STRAPI_VER=4.5.3

RUN yarn global add @strapi/strapi@${STRAPI_VER}

WORKDIR /srv/app
VOLUME /srv/app

COPY docker-entrypoint.sh /usr/local/bin

CMD ["strapi", "develop"]
