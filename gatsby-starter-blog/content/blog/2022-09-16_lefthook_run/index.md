---
title: "Git hooks の Lefthook を使ってみる"
date: "2022-09-16T23:59:59.000"
description: "Git hooks manager の lefthook を使ってみる"
---

Git hooks manager の lefthook を使ってみる  
https://github.com/evilmartians/lefthook


## 導入環境

- Ansible を扱っているプロジェクト
- pre-commit として ansible-lint を実行


## インストール

homebrew 経由でインストール

```sh
$ brew install lefthook
$ lefthook version
1.1.1
```


## 設定

`lefthook.yml` を用意する

```sh
---
pre-commit:
  parallel: true
  commands:
    ansible-lint:
      run: ansible-lint
```


## 確認

`lefthook run` で確認ができる

```sh
$ lefthook run pre-commit
Lefthook v1.1.1
RUNNING HOOK: pre-commit

  EXECUTE > ansible-lint

SUMMARY: (done in 8.62 seconds)
✔️  ansible-lint
```

