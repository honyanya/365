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
