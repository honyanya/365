---
title: "git でカレントブランチを取得"
date: "2021-07-18T23:30:00.000Z"
description: "git でカレントブランチを取得"
tags:
  - shellscript
---

git でカレントブランチを取得  

```sh
$ git symbolic-ref --short HEAD
feature/add_sgg_by_gatsby
```

echo での展開例  
git commit 時にも応用できる  

```sh
$ echo "[$(git symbolic-ref --short HEAD)][add] commit messages"
[feature/add_sgg_by_gatsby][add] commit messages
```

- 参考
  - [get current branch name - Qiita](https://qiita.com/sugyan/items/83e060e895fa8ef2038c)
