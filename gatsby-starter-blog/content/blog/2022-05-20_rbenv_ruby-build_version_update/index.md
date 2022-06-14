---
title: "rbenv でインストールできる Ruby のバージョンが古いため上げる"
date: "2022-05-20T23:59:59.999"
---

Ruby プロジェクトを触るときに、 rbenv でインストールする Ruby のバージョンが古いためアップデートするためのメモ  
rbenv は anyenv 経由で入れている  


# 先に対応方法のまとめ

ruby-build で更新してあげれば OK

```sh
$ cd ~/.anyenv/envs/rbenv/plugins/ruby-build/
$ git fetch origin
$ git merge origin/master
``` 


# 状況

bundle install しようとすると .ruby-version と rbenv の Ruby のバージョンが異なるためエラー

```sh
$ bundle install
rbenv: version `2.7.6' is not installed (set by /home/vagrant/workspace/src/path/to/project/.ruby-version)
```

anyenv のバージョン確認

```sh
$ anyenv versions                                                                    
nodenv:
* 16.14.0 (set by /home/vagrant/.anyenv/envs/nodenv/version)
phpenv:
  8.1.5
plenv:
  system
* 5.34.0 (set by /home/vagrant/.anyenv/envs/plenv/version)
pyenv:
  system
* 3.10.2 (set by /home/vagrant/.anyenv/envs/pyenv/version)
rbenv:
rbenv: version `2.7.6' is not installed (set by /home/vagrant/workspace/src/path/to/project/.ruby-version)
  3.1.0
```

install しようとすると 2.7.6 が無い

```sh
$ rbenv install 2.7.6
ruby-build: definition not found: 2.7.6

See all available versions with `rbenv install --list'.

If the version you need is missing, try upgrading ruby-build:

  git -C /home/vagrant/.anyenv/envs/rbenv/plugins/ruby-build pull
```

rbenv が見ているバージョンが最新を見ていない

```sh
$ rbenv install --list
2.6.9
2.7.5
3.0.3
3.1.1
jruby-9.3.3.0
mruby-3.0.0
rbx-5.0
truffleruby-22.0.0.2
truffleruby+graalvm-22.0.0.2

Only latest stable releases for each Ruby implementation are shown.
Use 'rbenv install --list-all / -L' to show all local versions.
```


## 対応内容

ruby-build があるパスに移動する  
anyenv 経由なら下記パスになる  

```sh
$ cd ~/.anyenv/envs/rbenv/plugins/ruby-build/
```

コミット確認

```sh
$ git log --oneline | head -n 10
10a56a2 Merge pull request #1942 from rbenv/openssl-1-1-1m
19d16b1 Bump up OpenSSL 1.1.1m
2a0475f ruby-build 20220218
f716c4d Merge pull request #1936 from rbenv/3-1-1
8ed6f91 Added Ruby 3.1.1
cbdbc6e ruby-build 20220125
45b9dd0 Add a simple CONTRIBUTING.md
2131cbf Add TruffleRuby and TruffleRuby GraalVM 22.0.0.2
4f1e62f Merge pull request #1913 from headius/jruby-9.3.3.0
3254d72 Add JRuby 9.3.3.0
```

git merge して更新する

```sh
$ git fetch origin      
remote: Enumerating objects: 144, done.
remote: Counting objects: 100% (144/144), done.
remote: Compressing objects: 100% (36/36), done.
remote: Total 144 (delta 106), reused 128 (delta 101), pack-reused 0
Receiving objects: 100% (144/144), 47.78 KiB | 5.31 MiB/s, done.
Resolving deltas: 100% (106/106), completed with 66 local objects.
From https://github.com/rbenv/ruby-build
   10a56a2..1038c07  master     -> origin/master
 * [new tag]         v20220324  -> v20220324
 * [new tag]         v20220412  -> v20220412
 * [new tag]         v20220415  -> v20220415
 * [new tag]         v20220426  -> v20220426

$ git merge origin/master 
Updating 10a56a2..1038c07
Fast-forward
 bin/ruby-build                              | 18 +++++++++++++-----
 share/ruby-build/2.4.0                      |  2 +-
 share/ruby-build/2.4.0-dev                  |  2 +-
 share/ruby-build/2.4.0-preview1             |  2 +-
 share/ruby-build/2.4.0-preview2             |  2 +-
 share/ruby-build/2.4.0-preview3             |  2 +-
 share/ruby-build/2.4.0-rc1                  |  2 +-
 share/ruby-build/2.4.1                      |  2 +-
 share/ruby-build/2.4.10                     |  2 +-
 share/ruby-build/2.4.2                      |  2 +-
 share/ruby-build/2.4.3                      |  2 +-
 share/ruby-build/2.4.4                      |  2 +-
 share/ruby-build/2.4.5                      |  2 +-
 share/ruby-build/2.4.6                      |  2 +-
 share/ruby-build/2.4.7                      |  2 +-
 share/ruby-build/2.4.8                      |  2 +-
 share/ruby-build/2.4.9                      |  2 +-
 share/ruby-build/2.5.0                      |  2 +-
 share/ruby-build/2.5.0-dev                  |  2 +-
 share/ruby-build/2.5.0-preview1             |  2 +-
 share/ruby-build/2.5.0-rc1                  |  2 +-
 share/ruby-build/2.5.1                      |  2 +-
 share/ruby-build/2.5.2                      |  2 +-
 share/ruby-build/2.5.3                      |  2 +-
 share/ruby-build/2.5.4                      |  2 +-
 share/ruby-build/2.5.5                      |  2 +-
 share/ruby-build/2.5.6                      |  2 +-
 share/ruby-build/2.5.7                      |  2 +-
 share/ruby-build/2.5.8                      |  2 +-
 share/ruby-build/2.5.9                      |  2 +-
 share/ruby-build/2.6.0                      |  2 +-
 share/ruby-build/2.6.0-dev                  |  2 +-
 share/ruby-build/2.6.0-preview1             |  2 +-
 share/ruby-build/2.6.0-preview2             |  2 +-
 share/ruby-build/2.6.0-preview3             |  2 +-
 share/ruby-build/2.6.0-rc1                  |  2 +-
 share/ruby-build/2.6.0-rc2                  |  2 +-
 share/ruby-build/2.6.1                      |  2 +-
 share/ruby-build/2.6.10                     |  2 ++
 share/ruby-build/2.6.2                      |  2 +-
 share/ruby-build/2.6.3                      |  2 +-
 share/ruby-build/2.6.4                      |  2 +-
 share/ruby-build/2.6.5                      |  2 +-
 share/ruby-build/2.6.6                      |  2 +-
 share/ruby-build/2.6.7                      |  2 +-
 share/ruby-build/2.6.8                      |  2 +-
 share/ruby-build/2.6.9                      |  2 +-
 share/ruby-build/2.7.0                      |  2 +-
 share/ruby-build/2.7.0-dev                  |  2 +-
 share/ruby-build/2.7.0-preview1             |  2 +-
 share/ruby-build/2.7.0-preview2             |  2 +-
 share/ruby-build/2.7.0-preview3             |  2 +-
 share/ruby-build/2.7.0-rc1                  |  2 +-
 share/ruby-build/2.7.0-rc2                  |  2 +-
 share/ruby-build/2.7.1                      |  2 +-
 share/ruby-build/2.7.2                      |  2 +-
 share/ruby-build/2.7.3                      |  2 +-
 share/ruby-build/2.7.4                      |  2 +-
 share/ruby-build/2.7.5                      |  2 +-
 share/ruby-build/2.7.6                      |  2 ++
 share/ruby-build/3.0.0                      |  2 +-
 share/ruby-build/3.0.0-dev                  |  2 +-
 share/ruby-build/3.0.0-preview1             |  2 +-
 share/ruby-build/3.0.0-preview2             |  2 +-
 share/ruby-build/3.0.0-rc1                  |  2 +-
 share/ruby-build/3.0.1                      |  2 +-
 share/ruby-build/3.0.2                      |  2 +-
 share/ruby-build/3.0.3                      |  2 +-
 share/ruby-build/3.0.4                      |  2 ++
 share/ruby-build/3.1.0                      |  2 +-
 share/ruby-build/3.1.0-dev                  |  2 +-
 share/ruby-build/3.1.0-preview1             |  2 +-
 share/ruby-build/3.1.1                      |  2 +-
 share/ruby-build/3.1.2                      |  2 ++
 share/ruby-build/3.2.0-dev                  |  2 +-
 share/ruby-build/3.2.0-preview1             |  2 ++
 share/ruby-build/jruby-9.3.4.0              |  2 ++
 share/ruby-build/truffleruby+graalvm-22.1.0 | 17 +++++++++++++++++
 share/ruby-build/truffleruby-22.1.0         | 17 +++++++++++++++++
 79 files changed, 129 insertions(+), 75 deletions(-)
 create mode 100644 share/ruby-build/2.6.10
 create mode 100644 share/ruby-build/2.7.6
 create mode 100644 share/ruby-build/3.0.4
 create mode 100644 share/ruby-build/3.1.2
 create mode 100644 share/ruby-build/3.2.0-preview1
 create mode 100644 share/ruby-build/jruby-9.3.4.0
 create mode 100644 share/ruby-build/truffleruby+graalvm-22.1.0
 create mode 100644 share/ruby-build/truffleruby-22.1.0
```

最新のバージョンが見れるようになる

```sh
$ rbenv install --list
2.6.10
2.7.6
3.0.4
3.1.2
jruby-9.3.4.0
mruby-3.0.0
rbx-5.0
truffleruby-22.1.0
truffleruby+graalvm-22.1.0

Only latest stable releases for each Ruby implementation are shown.
Use 'rbenv install --list-all / -L' to show all local versions.
```

お目当ての 2.7.6 をインストールしてバージョンを確認した

```sh
$ rbenv install 2.7.6
Downloading ruby-2.7.6.tar.bz2...
-> https://cache.ruby-lang.org/pub/ruby/2.7/ruby-2.7.6.tar.bz2
Installing ruby-2.7.6...
ruby-build: using readline from homebrew
Installed ruby-2.7.6 to /home/vagrant/.anyenv/envs/rbenv/versions/2.7.6

$ ruby -v
ruby 2.7.6p219 (2022-04-12 revision c9c2245c0a) [x86_64-linux]
```
