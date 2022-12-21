---
title: "xargs: unmatched single quote;"
date: "2022-11-22T23:59:59.000"
description: "node のイメージで動かしている Job があるときから正常に終了しなくなった"
---

node のイメージで動かしている Job があるときから正常に終了しなくなった  
xargs 周りのエラーが出力されていた

```sh
$ git diff origin/main --name-only | xargs yarn textlint -f checkstyle
xargs: unmatched single quote; by default quotes are special to xargs unless you use the -0 option
```

-0 オプションしないとシングルクォートがそのまま解釈されてエラーになるみたい  
-0 オプションを付けて無事動くことを確認した

```sh
$ git diff origin/main --name-only | xargs -0 yarn textlint -f checkstyle
...
✨  Done in 3.01s.
```

メッセージを見る限り、シングルクォートがファイル名にあるとダメっぽいがあったっけ？と思いつつ  
手元の環境下で試してみると確かに同じ状況になった

```sh
## シングルクォートがあるファイルを用意した
$ ls | grep md
'.md
READ'ME.md
README.md

## xargs に結果を渡す
$ ls | grep md | xargs echo
xargs: unterminated quote

## -0 オプション指定で実施
$ ls | grep md | xargs -0 echo
'.md
READ'ME.md
README.md

```

ダブルクォーテーションでも必要

```
$ ls | grep md | xargs echo
xargs: unterminated quote

$ ls | grep md | xargs -0 echo
".md
READ"ME.md
README.md

```

! や ? は不要だった

```
$ ls | grep md | xargs echo
!.md
READ!?ME.md
README.md
```

## 参考

- [xargs: unmatched single quote; by default quotes are special to xargs unless you use the -0 option - Ask Ubuntu](https://askubuntu.com/questions/1106805/xargs-unmatched-single-quote-by-default-quotes-are-special-to-xargs-unless-you)
