---
title: "grep で前後の行を出力する"
date: "2022-01-21T23:45:00.000"
---

# grep で前後の行を出力する

仕事で使っている Mac のバッテリーが修理サービス推奨が出ていたので、どれくらいの放充電回数かを調べた  
2021/08/11 に行っていたので、そのときのコマンドで叩いていつの間にか 1000 回超えてるなーと確認をした  

```sh
$ system_profiler SPPowerDataType | egrep 'Health Information:|Cycle Count:|Condition: Normal'
      Health Information:
          Cycle Count: 1562
          Condition: Normal
```

`egrep` で項目を絞っていたが、grep の -A オプションで指定行数分出力できると教えてもらった  
こんな感じ

```sh
$ system_profiler SPPowerDataType | grep 'Health Information' -A 2
      Health Information:
          Cycle Count: 1562
          Condition: Normal
```

grep のドキュメントを見てみる  

```sh
$ man grep

     -A num, --after-context=num
             Print num lines of trailing context after each match.  See also
             the -B and -C options.

     -B num, --before-context=num
             Print num lines of leading context before each match.  See also
             the -A and -C options.

     -C[num, --context=num]
             Print num lines of leading and trailing context surrounding each
             match.  The default is 2 and is equivalent to -A 2 -B 2.  Note:
             no whitespace may be given between the option and its argument.
```

-A オプションを指定すれば検索対象の後、-B オプションを指定すれば検索対象の前を取得できる  
-C は指定した行数前後で取得できる  
1~100 までの数値が書かれたファイルを用意して試してみる  

```sh
## 50 から後 2 行も取得
$ grep 50 sandbox/number.txt -A 2
50
51
52

## 50 から前 4 行も取得
$ grep 50 sandbox/number.txt -B 4
46
47
48
49
50

## 組み合わせ
$ grep 50 sandbox/number.txt -A 2 -B 4
46
47
48
49
50
51
52

## 50 から前後 3 行も取得
$ grep 50 sandbox/number.txt -C 3
47
48
49
50
51
52
53
```

ちょっと手元に良い例が無かったが該当処理のメソッドをチャットで共有すると良さそう（前にやったことある記憶があるが別の方法だったかも）  
こんな感じで  

```sh
$ grep 'test_helloWorld' sandbox/python/test_helloworld.py -A 5
    def test_helloWorld(self):
        expected = 'hello world!'
        actual = helloWorld()

        self.assertEqual(expected, actual)
```

久々に書きました、またゆるく続けられれば良いかなと思ってます
