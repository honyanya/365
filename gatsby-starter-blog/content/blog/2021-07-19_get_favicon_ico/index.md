---
title: "favicon の画像を取得する"
date: "2021-07-19T23:48:00.000Z"
description: "他に登録した favicon のアイコンをそのまま使いたかった"
tags:
  - none
---

他に登録した favicon のアイコンをそのまま使いたかった  
下記のようにすれば取得ができる  
例として Google の favicon を取得している  

https://www.google.com/s2/favicons?domain=https://www.google.com/

ダウンロードしたい場合は wget で取得すれば OK

```sh
$ wget -O favicon.ico https://www.google.com/s2/favicons?domain=https://www.google.com/
```
