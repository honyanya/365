---
title: "Android と Mac を接続して adb コマンドで確認する"
date: "2022-10-19T13:10:00.000"
description: "adb コマンドでいろいろ操作を行いたいため"
---

adb コマンドでいろいろ操作を行いたいため


## Mac 側の準備

macOS の場合、 Homebrew で `android-platform-tools` をインストールすれば OK

```sh
$ brew uninstall android-platform-tools

==> Installing Cask android-platform-tools
==> Linking Binary 'sload_f2fs' to '/usr/local/bin/sload_f2fs'
==> Linking Binary 'dmtracedump' to '/usr/local/bin/dmtracedump'
==> Linking Binary 'e2fsdroid' to '/usr/local/bin/e2fsdroid'
==> Linking Binary 'etc1tool' to '/usr/local/bin/etc1tool'
==> Linking Binary 'fastboot' to '/usr/local/bin/fastboot'
==> Linking Binary 'hprof-conv' to '/usr/local/bin/hprof-conv'
==> Linking Binary 'make_f2fs' to '/usr/local/bin/make_f2fs'
==> Linking Binary 'make_f2fs_casefold' to '/usr/local/bin/make_f2fs_casefold'
==> Linking Binary 'mke2fs' to '/usr/local/bin/mke2fs'
==> Linking Binary 'adb' to '/usr/local/bin/adb'
```


## Android 側の準備

開発者オプションを有効にしておく


## 接続確認

Mac と Android を USB で繋げる
`adb devices` で繋げた端末が確認できれば OK

```sh
adb devices
List of devices attached
*****   device
```
