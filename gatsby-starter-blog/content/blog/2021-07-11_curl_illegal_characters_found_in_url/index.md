---
title: "curl: (3) Illegal characters found in URL の対応"
date: "2021-07-11T00:00:00.000Z"
description: "ちょっと bash でスクリプトを書いてて"
tags:
  - none
---

ちょっと bash でスクリプトを書いてて  
なぜか curl でエラーが出るようになってしまった  

```sh
$ ./sample_script.sh 
curl: (3) Illegal characters found in URL
```

`./sample_script.sh` は環境変数を読み込むような形にしていた  

```sh
## 環境変数の読み込み
. ./.env
```

原因は `./.env` が CRLF で保存されており、 `^M` が入っていることでした......  
LF で保存してエラーが出ないことを確認した  

環境変数の読み込みもシェルが違うと対応できないのでいろいろ工夫がありそうだった  

- 参考
  - [【Bash】curl: (3) Illegal characters found in URLというエラーの解消法 - (O+P)ut](https://www.mtioutput.com/entry/curl-illegal-error)