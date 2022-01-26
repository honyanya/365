---
title: "Gatsby.js 触る"
date: "2021-07-22T23:41:00.000Z"
description: "gatsby cli あることが前提"
tags:
  - none
---

gatsby cli あることが前提  

`gatsby-starter-blog` テーマを使ってプロジェクトを作成する  

```sh
$ gatsby new gatsby-starter-blog https://github.com/gatsbyjs/gatsby-starter-blog
```

作成されたプロジェクトに移動する  

```sh
$ cd gatsby-starter-blog/
```

開発用環境を起動する  
ホットリロードで自動更新される  
実行後 http://localhost:8000/ で確認  

```sh
$ gatsby develop
```

デプロイ用に成果物をビルドする  
ビルドされたファイルは `./public/` に配置される  

```sh
$ gatsby build
```

ビルドされた成果物を元にサーバを起動して動作確認を行う  
デプロイ前に実施する  
実行後 http://localhost:9000/ で確認  

```sh
$ gatsby serve
```
