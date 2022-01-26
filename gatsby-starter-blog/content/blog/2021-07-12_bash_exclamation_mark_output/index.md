---
title: "bash で ! を出力する"
date: "2021-07-12T00:00:00.000Z"
description: "bash で ! は最新のコマンドが実行される"
tags:
  - none
---

bash で ! は最新のコマンドが実行される  
ヒストリ展開とも呼ばれてるみたい  
なので純粋に ! を使うことができない  

```sh
$ echo "!"
bash: !: event not found
```

例えば hello world! と出力しても ! がヒストリが参照されこのような実行になってしまった  

```sh
$ echo "hello world!"
echo "hello world"
hello world
```

解決策は `set +H` で機能を無効化することができる  

```sh
$ set +H

$ echo "!"
!

$ echo "hello world!"
hello world!
```

- 参考
  - [command line - -bash: !": event not found - Stack Overflow](https://stackoverflow.com/questions/26443880/bash-event-not-found)
  - [[Bash] ダブルクォートで囲んだコマンド置換中で!を使うとエラーになる（例: echo "$(echo '!')"） - Qiita](https://qiita.com/anqooqie/items/785f46a8cc5f10ba7abb)
