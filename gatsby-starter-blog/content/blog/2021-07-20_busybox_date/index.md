---
title: "BusyBox date を触る"
date: "2021-07-20T23:52:00.000Z"
description: "date コマンドで実行しているスクリプトがあって Alpine Linux の環境で動かすと期待度通りに動いてくれなかった"
tags:
  - none
---

date コマンドで実行しているスクリプトがあって  
Alpine Linux の環境で動かすと期待度通りに動いてくれなかった  

そもそも date コマンドには 3 つあるみたい  

- BSD date
- GNU coreutils date
- BusyBox date

2021/07/16 の記事では BSD date と GNU coreutils date について書いたが、今回は BusyBox date を簡単に触る  

Docker で Alpine Linux を触る  

```sh
$ docker run -it alpine:latest /bin/sh
```

date コマンドを見てみる  

```sh
# date --help
BusyBox v1.33.1 () multi-call binary.
...
```

もちろん BSD date や GNU coreutils date で使える日付操作のオプションが使えない  

```sh
# date '+%Y-%m-%d' -d '1 day ago'
date: invalid date '1 day ago'

# date '+%Y-%m-%d' -v -1d
date: unrecognized option: v
...
```

日付計算で出力する必要がある  

```sh
# date '+%Y-%m-%d' -d "1970.01.01-00:00:$(( $( date +%s ) - $(( 24 * 60 * 60 )) ))"
2021-07-19
```

月末の日を求めたかったが計算がややこしくなりそうだったので BusyBox date を使わない別の方法を考えることにした  

- 参考
  - [date コマンドつらい - bearmini's blog](https://bearmini.hatenablog.com/entry/2017/06/19/115255)
