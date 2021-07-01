# 2021/07

<!-- TOC -->

- [2021/07](#202107)
    - [2021/07/01 Thu](#20210701-thu)

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

