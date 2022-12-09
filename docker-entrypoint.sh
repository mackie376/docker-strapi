#!/usr/bin/env bash

set -ea

if [[ "$1" == "strapi" ]]; then

  if [[ ! -f "package.json" ]]; then

    DATABASE_CLIENT=${DATABASE_CLIENT:-postgres}
    EXTRA_ARGS=${EXTRA_ARGS}

    echo "Using strapi $(strapi version)"
    echo "No project fund at /srv/app. Creating a new strapi project"

    DOCKER=true strapi new . \
      --dbclient=$DATABASE_CLIENT \
      --dbhost=$DATABASE_HOST \
      --dbport=$DATABASE_PORT \
      --dbname=$DATABASE_NAME \
      --dbusername=$DATABASE_USERNAME \
      --dbpassword=$DATABASE_PASSWORD \
      --dbssl=$DATABASE_SSL \
      $EXTRA_ARGS

    yarn strapi install graphql
    yarn build

  elif [[ ! -d "node_modules" ]] || [[ ! "$(ls -qAL node_modules) 2>/dev/null" ]]; then

    echo "Node modules not installed. Installing..."

    if [[ -f "yarn.lock" ]]; then
      yarn install
    else
      npm install
    fi

  fi

fi

echo "Starting your app..."

exec "$@"
