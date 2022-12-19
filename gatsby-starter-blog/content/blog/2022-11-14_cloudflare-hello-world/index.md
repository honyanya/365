---
title: "Cloudflare D1 Hello World"
date: "2022-11-14T23:59:59.000"
description: "Cloudflare D1 が出たので公式ドキュメントを見ながら Hello World をやる"
---

Cloudflare D1 が出たので[公式ドキュメント](https://developers.cloudflare.com/d1/wrangler-commands/)を見ながら Hello World をやる  
wrangler を使えるように npm プロジェクトに対して `yarn add -D wrangler` を実施しておく

## データベースを作成する

`wrangler d1 create <database-name>` で作成できる

```sh
## wrangler d1 create <database-name>
yarn wrangler d1 create hello-d1-database
...
[[ d1_databases ]]
binding = "DB" # i.e. available in your Worker on env.DB
database_name = "hello-d1-database"
database_id = "********-****-****-****-************"
✨  Done in 3.57s.
```


## データベースを確認する

`yarn wrangler d1 list` で作成したデータベースを確認できる

```sh
yarn wrangler d1 list
...
┌──────────────────────────────────────┬───────────────────┐
│ uuid                                 │ name              │
├──────────────────────────────────────┼───────────────────┤
│ ********-****-****-****-************ │ hello-d1-database │
└──────────────────────────────────────┴───────────────────┘
...
```


## クエリを実行

まだテーブルなどは作成してないがとりあえず実行してみる

```sh
## yarn wrangler d1 execute <database-name> --command "<SQL-query>"
yarn wrangler d1 execute hello-d1-database --command "SELECT 'Hello D1!' AS hello_world"
...
┌─────────────┐
│ hello_world │
├─────────────┤
│ Hello D1!   │
└─────────────┘
...
```
