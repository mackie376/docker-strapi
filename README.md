# docker-starpi

[Starpi](https://strapi.io/) が動作する Docker イメージを構築するための環境一式です。

## ビルド方法

```sh
git clone https://github.com/mackie376/docker-strapi <project-root>

cd <project-root>

docker build -t strapi:4.4.7 --build-arg STRAPI_VER=4.4.7 .
```

## 使い方

作成されるイメージにはデータベースは含まれていないので、別途データベースなどを用意する必要があります。
リポジトリの中に docker-compos.yml のサンプルファイルを用意しておいたので、参考にしてください。

## 使用しているプラグイン

- @strapi/plugin-graphql
