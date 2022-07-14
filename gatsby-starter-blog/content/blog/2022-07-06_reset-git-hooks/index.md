---
title: "Git Hooks を初期化する"
date: "2022-07-06T23:59:59.999"
---

Velociraptor の設定変更をしたが変更が反映されなかったため  
再 clone して修正するのもおかしな話なのでできる方法が無いかを探した


## 初期化方法

`.git/hooks/` を削除して `git init` を実行すれば OK  
既に存在しているリポジトリで `git init` を行うと再初期化できる  

```sh
$ rm -rf .git/hooks 
$ git init
Reinitialized existing Git repository in /path/to/project/.git/
```

再初期化に Git Hooks 初期化が行われて、 `.git/hooks/` が作成される  
変更した Git Hooks の設定を反映することができた

再初期化といっても現在の変更がなくなるとかは無い  


## 確認

hooks が設定済みの状態、 `pre-commit` などがある

```sh
$ ls .git/hooks/           
applypatch-msg         commit-msg.sample          post-checkout  post-rewrite        pre-applypatch         pre-commit         pre-merge-commit.sample    pre-push         pre-rebase.sample   push-to-checkout.sample
applypatch-msg.sample  fsmonitor-watchman.sample  post-commit    post-update         pre-applypatch.sample  pre-commit.sample  prepare-commit-msg         pre-push.sample  pre-receive.sample  sendemail-validate
commit-msg             post-applypatch            post-merge     post-update.sample  pre-auto-gc            pre-merge-commit   prepare-commit-msg.sample  pre-rebase       push-to-checkout    update.sample

$ ls .git/hooks/pre-commit
.git/hooks/pre-commit
```

差分がある状態

```sh
$ git diff --name-only
command.ts
```

hooks 削除して再初期化を実施

```sh
$ rm -rf .git/hooks/
$ git init
Reinitialized existing Git repository in /path/to/project/.git/
```

hooks があるが、 sample のみ

```sh
$ ls .git/hooks/    
applypatch-msg.sample  fsmonitor-watchman.sample  pre-applypatch.sample  pre-merge-commit.sample    pre-push.sample    pre-receive.sample       update.sample
commit-msg.sample      post-update.sample         pre-commit.sample      prepare-commit-msg.sample  pre-rebase.sample  push-to-checkout.sample
```

hooks 再設定

```sh
$ vr
```

pre-commit があることを確認

```sh
$ ls .git/hooks/
applypatch-msg         commit-msg.sample          post-checkout  post-rewrite        pre-applypatch         pre-commit         pre-merge-commit.sample    pre-push         pre-rebase.sample   push-to-checkout.sample
applypatch-msg.sample  fsmonitor-watchman.sample  post-commit    post-update         pre-applypatch.sample  pre-commit.sample  prepare-commit-msg         pre-push.sample  pre-receive.sample  sendemail-validate
commit-msg             post-applypatch            post-merge     post-update.sample  pre-auto-gc            pre-merge-commit   prepare-commit-msg.sample  pre-rebase       push-to-checkout    update.sample

$ ls .git/hooks/pre-commit
.git/hooks/pre-commit
```

差分がある状態のまま

```sh
$ git diff --name-only
command.ts
```


## 参考

- [Git hookを初期化する - テクめも](https://www.xn--ebkc7kqd.com/entry/git-hook-init)
- [git initで"Reinitialized existing Git repository in ..."とか出たのをエラーと勘違いした - Qiita](https://qiita.com/ragingalpaca/items/ef247e459ff2e7759ba9#%E3%81%A1%E3%81%AA%E3%81%BF%E3%81%ABreinitialized%E3%81%A8%E3%81%84%E3%81%A3%E3%81%A6%E3%82%82)
