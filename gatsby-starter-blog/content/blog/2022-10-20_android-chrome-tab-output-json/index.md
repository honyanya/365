---
title: "Android の Chrome でタブ一覧を取得する"
date: "2022-10-20T23:59:59.000"
description: "昨日の続きで Android の Chrome のタブ一覧を取得する"
---

昨日の続きで Android の Chrome のタブ一覧を取得する  
基本的に下記２コマンドで取得することができる

```sh
$ adb forward tcp:9222 localabstract:chrome_devtools
$ wget -O tabs.json http://localhost:9222/json/list
```

取得したファイルはこんな感じでタブ情報の配列で取得ができる（一部加工有り、 YouTube だけにしてる）

```sh
$ cat output.json
[
  {
    "description": "",
    "devtoolsFrontendUrl": "https://chrome-devtools-frontend.appspot.com/serve_rev/@......./inspector.html?ws=localhost:9222/devtools/page/27234",
    "id": "27234",
    "title": "ホーム - YouTube",
    "type": "page",
    "url": "https://m.youtube.com/",
    "webSocketDebuggerUrl": "ws://localhost:9222/devtools/page/27234"
  },
]
```

Android の Chrome に拡張機能は使えず、こういう手段でタブ一覧を取得するしかない  
タブを貯めすぎるのも良くないので定期的に削除しよう

```sh
$ cat output.json | jq length
5129
```


## 参考

- [AndroidのChromeアプリで開いているタブのURLを全部取得する方法 - j3iiifn’s blog](https://j3iiifn.hatenablog.com/entry/2019/07/14/193000)
- [How can I export the list of open Chrome tabs? - Android Enthusiasts Stack Exchange](https://android.stackexchange.com/questions/56635/how-can-i-export-the-list-of-open-chrome-tabs/199496#199496)
