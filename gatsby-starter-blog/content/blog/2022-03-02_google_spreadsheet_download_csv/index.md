---
title: "Google スプレッドのシートの内容を CSV でダウンロードする"
date: "2022-03-02T23:50:00.000"
---

下記のような URL に変換してアクセスすれば CSV を取得することができる

```sh
https://docs.google.com/spreadsheets/d/{{ gooogle_spreadsheets_id }}/gviz/tq?tqx=out:csv&sheet={{ sheet_name }}
```

こんなスプレッドシートの内容なら

|列1 |列2 |列3 |
|---|---|---|
|あ  |い  |う  |
|え  |お  |か  |
|き  |く  |け  |

下記のテキストデータになる

```sh
"列1","列2","列3"
"あ","い","う"
"え","お","か"
"き","く","け"
```

もともとのきっかけは複数の Google スプレッドシートの中身を確認して処理をしたかった  
プログラムで処理するときは OAuth 認証経由で Google ドライブにアクセスして ID を取得して操作することになりそうだが、時間がかかりそうだったのでスキップ  
今回は結局スプレッドシートにアクセスしてファイルからカンマ区切り形式でダウンロードする形にした  

今回は行データのみだけど結合とかされているデータなどはどうなるのかは未検証

参考

- [r googlesheets - How to export a csv from Google Sheet API? - Stack Overflow](https://stackoverflow.com/questions/37705553/how-to-export-a-csv-from-google-sheet-api)
