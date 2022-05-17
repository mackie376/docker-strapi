# docker-strapi

- version: 4.1.11

## ビルド方法

```sh
git clone https://github.com/mackie376/docker-strapi <project-root>

cd <project-root>

docker build -t strapi:4.1.11 .
```

## 使い方

作成されるイメージにはデータベースは含まれていませんので、別途データベース (progresql) を起動しておく必要があります。
以下に、docker-compose.yml を使った場合のサンプルを用意しておきます。

```yaml
version: '3'

services:
  db:
    image: postgres:14.2-bullseye
    container_name: strapi-db
    hostname: strapi-db
    volumes:
      - ./data/db:/var/lib/postgresql/data
    environment:
      POSTGRES_DB: strapi
      POSTGRES_USER: strapi
      POSTGRES_PASSWORD: super-secret

  app:
    image: strapi:4.1.11
    container_name: strapi-app
    hostname: strapi-app
    depends_on:
      - db
    ports:
      - '1337:1337'
    environment:
      DATABASE_HOST: db
      DATABASE_NAME: strapi
      DATABASE_USERNAME: strapi
      DATABASE_PASSWORD: super-secret
```

## 使用しているプラグイン

- ```@strapi/plugin-graphql```

## 使用上の注意

このイメージでは、```progresql``` のみを対応しているデータベースとしています。
もしも他のデータベースを使用する場合は volume などを使って、
```/app/config/database.js``` を変更するなどしてください。
