---
title: "シェルスクリプトで標準入力"
date: "2021-07-17T00:00:00.000Z"
description: "シェルスクリプトで標準入力"
tags:
  - shellscript
---

簡単なスクリプトを書いてて、標準出力した内容をスクリプトに渡したい  

`cat -` と入力することで可能になる  
入力したものがそのまま出力される  

こんな感じのスクリプトを書いた  
標準出力を渡して、文字を結合して出力を行うスクリプト  

```sh
#!/bin/sh

readonly CONTENTS=$(cat -)
echo $CONTENTS "is input value."
```

実行結果  

```sh
$ echo 'a b c d e' | ./sample_input.sh
a b c d e is input value.
```

テキストファイルを整形して、スクリプトに渡して処理が可能になる  
