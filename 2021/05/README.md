# 2021/05

## 2021/05/21 Fri

MySQL の大文字小文字を区別する  

MySQL を使ってて英語の大文字小文字が識別できないという問題があった  
`BINARY` 演算子を使って試したが、データ量が多いので根本的に見直す必要がありそう  

```sql
SELECT BINARY 'a' = 'A';
```

カラムの照合順序が `utf8_general_ci` だから `utf8_bin` に直せば良いのかな  

```sql
ALTER TABLE `xxx_table` MODIFY COLUMN `xxx_column` TEXT COLLATE 'utf8_bin';
```

DB でアプリケーションの仕様に影響が出てきてしまうので難しいですね  

- 参考
  - MySQL 5.6 のドキュメントだけど......
    - [MySQL :: MySQL 5.6 リファレンスマニュアル :: 10.1.7.7 BINARY 演算子](https://dev.mysql.com/doc/refman/5.6/ja/charset-binary-op.html)
    - [MySQL :: MySQL 5.6 リファレンスマニュアル :: 10.1.7.6 _bin および binary 照合順序](https://dev.mysql.com/doc/refman/5.6/ja/charset-binary-collations.html)
  - [MySQL: utf8_bin と utf8_general_ci と utf8_unicode_ci - fメモ いまさら館](http://ftsh.hateblo.jp/entry/2016/04/16/100937)


## 2021/05/22 Sat

Windows 10 Home へのリモートデスクトップ接続をしたい  

Windows へのリモートデスクトップ接続をしたいなと思って  
前できたよなと思ったらどうやら Pro エディションじゃないとリモートデスクトップ接続ができないみたい  
そもそも Home エディションにはリモートデスクトップ接続の設定がない  

はて、と調べてみると [RDPWrap](https://github.com/stascorp/rdpwrap/releases) とういうものがある  
設定すれば Home エディションでもリモートデスクトップ接続ができるらしい  

明日あたりにでもやってみようかな  

- 参考
  - [Windows10Homeでリモートデスクトップ出来ない人へ！簡単に接続可能！ | 快晴ブログ](https://kaisei-eigo.com/remote-desktop-home-edition)


## 2021/05/23 Sun

RDPWrap を使って Windows 10 Home へのリモートデスクトップ接続をした  

昨日の続き  
[参考記事](https://kaisei-eigo.com/remote-desktop-home-edition)の通りにやってみたが Listener State が `Not Listening` となり接続ができない  
[別の記事](https://kaoruya.org/blog/rdpwrap/)を試したら接続することができた  

主にやったことは下記 3 点

- `Remote Desktop Service` の停止
- `rdpwrap.ini` の更新
- 再起動

上記で Listener State が `Listening` となり接続ができた  

![Microsoft Remote Desktop](./images/23/2021-05-23_01_remote_desktop_config.png)  

![login](./images/23/2021-05-23_02_remote_login.png)  

![windows_desktop](./images/23/2021-05-23_03_remote_desktop.png)  

ここまでやったが Chrome リモート デスクトップの方が早くて簡単かもしれない......  

- 参考
  - [【画像つき】Windows10 Homeでもリモートデスクトップを使う方法](https://kaoruya.org/blog/rdpwrap/)

