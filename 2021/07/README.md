# 2021/07

<!-- TOC -->

- [2021/07](#202107)
    - [2021/07/01 Thu](#20210701-thu)
    - [2021/07/02 Fri](#20210702-fri)

<!-- /TOC -->


## 2021/07/01 Thu

Python でテストをやってみる  

前に Python でスクリプトを書いてみたので、テストコードを書くことにしてみた  
シンプルに "hello world!" と出力されているかをテストで書いてみる  

こんなスクリプトを用意して  

`helloworld.py`

```py
#!/usr/bin/env python
# -*- coding: utf-8 -*-

def main():
    message = helloWorld()
    print(message)

def helloWorld():
    return 'hello world!'

if __name__ == "__main__":
    main()
```

実行するとこんな感じ  

```sh
$ python ./helloworld.py
hello world!
```

テストを書いてみる  
`unittest` を使用してこんな感じに書く  

`test_hellowold.py`

```py
#!/usr/bin/env python
# -*- coding: utf-8 -*-
import unittest
from helloworld import helloWorld

class TestHelloWorld(unittest.TestCase):

    def test_helloWorld(self):
        expected = 'hello world!'
        actual = helloWorld()

        self.assertEqual(expected, actual)

if __name__ == "__main__":
    unittest.main()
```

テストを実行するとこんな感じ  

```sh
$ python ./test_helloworld.py 
.
----------------------------------------------------------------------
Ran 1 test in 0.000s
```

- 参考
  - [Python標準のunittestの使い方メモ - Qiita](https://qiita.com/aomidro/items/3e3449fde924893f18ca)
  - [最短で試すPythonテストコード - Qiita](https://qiita.com/phorizon20/items/acb929772aaae4f52101)


## 2021/07/02 Fri

jq コマンドで出力した結果のダブルクォーテーションを外す  

こんな JSON があって  

```json
{
  "key1": "value1",
  "key2": "value2",
  "key3": "value3"
}
```

こんな感じで値を取得する  

```sh
$ cat ./sample.json | jq '.key2'
"value2"
```

このダブルクォーテーションを外して、別の処理に渡したい  
sed でダブルクォーテーションを空文字に変換することもできるけど  

```sh
$ cat ./sample.json | jq '.key2' | sed 's/"//g'
value2
```

jq には -r オプションがあるのでそちらを使うと OK  

```sh
$ cat ./sample.json | jq -r '.key2'
value2
```

- 参考
  - [jq コマンドを使う日常のご紹介 - Qiita](https://qiita.com/takeshinoda@github/items/2dec7a72930ec1f658af)

