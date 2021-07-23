---
title: "USB の読み込みができなくなった"
date: "2021-07-23T23:45:00.000Z"
description: "ちょっとラップトップの SSD を整理しようかなと思い、ちょっと前に使ってた USB を出して接続してみた"
tags:
  - shellscript
---

USB の読み込みができなくなった  

ちょっとラップトップの SSD を整理しようかなと思い、ちょっと前に使ってた USB を出して接続してみた  
最初はファイルが見れていたがある時から「ディスクの不正な取り出し」というポップアップが出てきて、数回試しても読み込みができなくなった  

USB だけに入れていたデータどうしようと思いつつも df コマンドを叩いてみた  

```sh
$ df -h | grep '/dev/disk3s1'
/dev/disk3s1    29Gi   13Gi   17Gi    44%        0       0  100%   /Volumes/usb-32g
```

grep しているので分かりづらいのでヘッダー情報も付けてみる  

```sh
$ df -h | egrep 'Filesystem|/dev/disk2s2'
Filesystem      Size   Used  Avail Capacity  iused   ifree %iused  Mounted on
/dev/disk3s1    29Gi   13Gi   17Gi    44%        0       0  100%   /Volumes/usb-32g
```

isued / ifree がともに 0 で %iused が 100% になっている  
確かにファイル数が多かったが、 isued / ifree がともに 0 になっていたのでどうしようかなと悩み中  
また悩みが増えてきた  
