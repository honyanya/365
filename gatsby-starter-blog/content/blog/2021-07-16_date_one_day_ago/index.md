---
title: "Mac の data コマンドで 1 日前を指定する"
date: "2021-07-16T00:00:00.000Z"
description: "Mac だと -d オプションで指定ができなかったのでメモ"
tags:
  - none
---

Mac だと -d オプションで指定ができなかったのでメモ  
普段 CentOS などでは下記のように実行している  

```sh
$ date '+%Y-%m-%d' -d '1 day ago'
2021-07-15
```

Mac だと -v オプションで指定する必要がある  

```sh
$ date -v -1d '+%Y-%m-%d'
2021-07-15
```

どうやら Free BSD 系などの OS は -v で指定するみたい  

- 参考
  - [Macのdateコマンドで前日の日付を取得する - Qiita](https://qiita.com/___uhu/items/3c2312359da542cda163)
  - [dateコマンドの使い方: UNIX/Linuxの部屋](http://x68000.q-e-d.net/~68user/unix/pickup?date#prgmemo-date-date-calc-bsd)
