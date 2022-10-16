---
title: "macOS Google Chrome ブックマークと Session Buddy 拡張機能の保存場所"
date: "2022-10-09T23:59:59.000"
description: "データの移行で保存場所を知りたかったので調べた"
---

データの移行で保存場所を知りたかったので調べた

Chrome Bookmark の保存場所

```sh
cat ~/Library/Application\ Support/Google/Chrome/Default/Bookmarks | jq
```

[Session Buddy](https://chrome.google.com/webstore/detail/session-buddy/edacconmaakjimmfgnblocblbcdcpbko?hl=ja) の保存場所

```sh
cat ~/Library/Application\ Support/Google/Chrome/Default/databases/chrome-extension_edacconmaakjimmfgnblocblbcdcpbko_0/1
```


## 参考

- [その他　macOSでの主要ブラウザのブックマークファイルの場所](https://www.oborodukiyo.info/etc/2020/ETC-BookmarksLocationWithMajorBrowsersOnMac)
- [How to Back Up and Restore Session Buddy Data (Advanced) – Session Buddy](https://sessionbuddy.com/backup-restore-advanced/)
- [How to Locate Session Buddy Data on Your Computer – Session Buddy](https://sessionbuddy.com/data-location/)
