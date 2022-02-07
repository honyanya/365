---
title: "gcloud でアクティブなプロジェクトを調べる"
date: "2022-02-07T23:32:00.000"
---

下記で調べることができる  

```sh
$ cat ~/.config/gcloud/active_config
default
```

複数のプロジェクトを触っていると、どのプロジェクトを触ってるのかわからない場合がある  
その場合はプロンプトの表示を行なっている `PS1` に追加すると良い

例

```sh
$ export PS1='[$(cat $HOME/.config/gcloud/active_config)] \$ '
[default] $
```

ちなみに設定は以下のディレクトリに入っており

```sh
$ ls ~/.config/gcloud/configurations/
config_default		config_project-xxx
```

下記で設定した中身を見ることができる

```sh
$ cat ~/.config/gcloud/configurations/config_default
[core]
account = xxx
project = xxx

[compute]
zone = asia-northeast1-a
region = asia-northeast1
```

参考

- [gcloud でプロジェクトの切り替え設定 - Qiita](https://qiita.com/sonots/items/906798c408132e26b41c)
