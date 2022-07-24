---
title: "今 UTC+9 ではなく、 UTC+8 の場所にいるので Mac の date コマンドで見てみる"
date: "2022-07-20T23:59:59.999"
---

5 泊 6 日のモンゴル旅行に来た  
良い機会なのでシステムで時差を感じてみる

日本とモンゴルの時差は 1 時間で、モンゴル時間 9 時の時、日本時間は 10 時となる

NTP で `Apple (time.apple.com)` を参照して同期されるため、 ネットワーク接続すると時刻が変更された

```sh
## binary? db? みたいなので cat では正常に出力できない
$ cat /etc/localtime

## /var/db/timezone/zoneinfo/ へのシンボリックリンクが貼られている
$ ls -al /etc/localtime
lrwxr-xr-x  1 root  wheel  42  7 20 22:39 /etc/localtime -> /var/db/timezone/zoneinfo/Asia/Ulaanbaatar
```

実際に date で日時を見てみる

```sh
$ date
2022年 7月20日 水曜日 22時40分01秒 +08

$ date -R
Wed, 20 Jul 2022 22:41:06 +0800

$ date +"%Y/%m/%d %H:%M:%S %Z"
2022/07/20 22:43:14 +08
```

日本時間も見ておく  
`TZ` を指定すれば OK

```sh
$ ls /usr/share/zoneinfo | grep Japan
Japan

$ TZ=Japan date
2022年 7月20日 水曜日 23時48分08秒 JST

$ TZ=Japan date -R
Wed, 20 Jul 2022 23:49:02 +0900

$ TZ=Japan date +"%Y/%m/%d %H:%M:%S %Z"
2022/07/20 23:50:35 JST
```

来たばっかりで、他の電子機器等の時計を合わせてないので 23 時の気分だけど現地は 22 時です


## 参考

- [Macでdateコマンドを使いこなす - ののいち の １.２..３...](https://nonoichi123.hatenablog.com/entry/mac%25e3%2581%25a7date%25e3%2582%25b3%25e3%2583%259e%25e3%2583%25b3%25e3%2583%2589%25e3%2582%2592%25e4%25bd%25bf%25e3%2581%2584%25e3%2581%2593%25e3%2581%25aa%25e3%2581%2599/)
- [JST、GMT、UTCとは？ 英語で押さえるべき日本と世界の標準時 | 翻訳の代行・見積なら スピード翻訳](https://www.quicktranslate.com/blog/2017/11/jst%E3%80%81gmt%E3%80%81utc%E3%81%A8%E3%81%AF%EF%BC%9F-%E8%8B%B1%E8%AA%9E%E3%81%A7%E6%8A%BC%E3%81%95%E3%81%88%E3%82%8B%E3%81%B9%E3%81%8D%E6%97%A5%E6%9C%AC%E3%81%A8%E4%B8%96%E7%95%8C%E3%81%AE%E6%A8%99/)
