---
title: "Base64 のエンコード・デコードをワンライナーで実行する"
date: "2021-07-21T23:54:00.000Z"
description: "昔サーバ構築の際に教わったが忘れてしまっていたので"
tags:
  - none
---

昔サーバ構築の際に教わったが忘れてしまっていたので  
Perl を用いてワンライナーで実行することができるので楽  

Base64 へエンコードする  

```sh
$ echo "user1:password1" | perl -MMIME::Base64 -0777 -ne 'print encode_base64($_)'
dXNlcjE6cGFzc3dvcmQxCg==
```

Base64 からデコードする  

```sh
echo "dXNlcjE6cGFzc3dvcmQxCg==" | perl -MMIME::Base64 -0777 -ne 'print decode_base64($_)'
user1:password1
```

- 参考
  - [Perl の便利な 1 行コマンド](http://www.redout.net/data/oneliner.html)
