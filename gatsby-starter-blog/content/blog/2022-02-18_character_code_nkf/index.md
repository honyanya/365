---
title: "ターミナルで文字コードを確認して変更する"
date: "2022-02-18T23:55:00.000"
---

直近で複数のテキストファイルを触る機会があって文字コード周りで問題があった  
今まではエディタでテキストファイルで開いたあと、文字コードを選択し直して保存などをしていた  
ターミナルでサクッとできないかと調べたら nkf コマンドでできるみたい  
Mac なのでサクッと Homebrew 経由でインストールする  

```sh
$ brew install nkf
```

テキストファイルを作って文字コードを調べてみる  

```sh
$ touch sample1.txt
$ nkf -g sample1.txt
ASCII
```

そのままだと ASCII

```sh
$ touch sample2.txt
$ echo "abcde" > sample2.txt
$ nkf -g sample2.txt
ASCII

$ touch sample3.txt
$ echo "あいうえお" > sample3.txt
$ nkf -g sample3.txt
UTF-8
```

日本語を書き込むと UTF-8 になる

SJIS に変換

```sh
$ nkf -s --overwrite sample3.txt
$ nkf -g sample3.txt
Shift_JIS
```

UTF-8 に変換

```sh
$ nkf -w --overwrite sample3.txt
$ nkf -g sample3.txt
UTF-8
```

複数ファイルを触るときもコマンドでできるので非常に楽  
もっと早くに知りたかった

参考

- [nkfで文字コード変換 - Qiita](https://qiita.com/kentakozuka/items/d874a572ddf6cc34213f)