---
title: "git init 時のデフォルトブランチを変更する"
date: "2022-09-01T23:59:59.000"
description: "git init すると master ブランチが作成されたので main ブランチに変更する"
---

git init すると master ブランチが作成されたので main ブランチに変更する


## 事象

git init すると下記のような hint が表示された

```sh
$ git init
hint: Using 'master' as the name for the initial branch. This default branch name
hint: is subject to change. To configure the initial branch name to use in all
hint: of your new repositories, which will suppress this warning, call:
hint:
hint: 	git config --global init.defaultBranch <name>
hint:
hint: Names commonly chosen instead of 'master' are 'main', 'trunk' and
hint: 'development'. The just-created branch can be renamed via this command:
hint:
hint: 	git branch -m <name>
Initialized empty Git repository in /Users/user/workspace/tmp/project/.git/

$ git branch --show-current
master
```

hint に書いてあるとおり `git config --global init.defaultBranch <name>` で変更ができる


## 対応

```sh
$ git config --global init.defaultBranch main
$ git config --list | grep "init.defaultbranch="
init.defaultbranch=main
```


## 確認

`.git` を削除後、 `git init` を行う

```sh
$ rm -rf ./.git/

$ git init
Initialized empty Git repository in /Users/user/workspace/tmp/project/.git/

$ git branch --show-current
main
```


## もうひとつの対応方法

git init 時に指定する方法

`git init -b <name>`

```
$ git init -b development
Initialized empty Git repository in /Users/user/workspace/tmp/project/.git/

$ git branch --show-current
development
```
