# 2021/08

<!-- TOC -->

- [2021/08](#202108)
    - [2021/08/01 Sun](#20210801-sun)

<!-- /TOC -->


## 2021/08/01 Sun

Mac でスクリーンショットのファイル名を変更する  

下記のコマンドで変更ができる  
`name` で名前、 `include-date` で日時をどうするかを決める  

```sh
## `スクリーンショット 2021-08-01 23.56.11.png` -> `screenshot.png`
$ defaults write com.apple.screencapture name "screenshot"
$ defaults write com.apple.screencapture include-date -bool false

## デフォルトに戻す
$ defaults write com.apple.screencapture name スクリーンショット
$ defaults delete com.apple.screencapture include-date
```

`killall SystemUIServer` は Sierra 以降なら不要みたい

- 参考
  - [Macでスクリーンショットのファイル名・形式・保存場所を変更する | Qookie Tech](https://tech.qookie.jp/posts/custom-mac-screenshot/)
  - [[macOS] そのkillallは本当に必要？ [screenshot] - Qiita](https://qiita.com/masakihori/items/646bad690b14cb6df430)

